ActiveAdmin.register Category do

  permit_params do
    permitted = :name
    #permitted << :product if resource.something?
  end

  sidebar "Category Products", only: [:show, :edit] do
    ul do
      li link_to("New product", new_admin_category_product_path(category.id))
      li link_to("All products", admin_categories_path)
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
