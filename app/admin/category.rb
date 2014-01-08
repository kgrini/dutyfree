ActiveAdmin.register Category do

  permit_params do
    permitted = :name
    #permitted << :product if resource.something?
  end

  sidebar "Category Products", only: [:show, :edit] do
    ul do
      li link_to("New product", new_admin_category_product_path(category.id))
      li link_to("All products", admin_category_products_path(category.id))
    end
  end

  index do
    column :id
    column :name
    column :created_at
    column :products do |category|
      ul do
        li link_to("All products", admin_category_products_path(category))
        li link_to("Create Product", new_admin_category_product_path(category))
      end
    end
    column :functions do |category|
      ul do
        li link_to("View", admin_category_path(category))
        li link_to("Edit", edit_admin_category_path(category.id))
        li link_to("Delete", admin_category_path(category), method: :delete, :confirm => "Are you Sure?")
      end
    end
  end
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

end
