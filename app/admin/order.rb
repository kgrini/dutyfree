ActiveAdmin.register Order do

  index do
    column :id
    column :name
    column :address
    column :email
    column :phone
    column :created_at
    column :orders do |order|
      ul do
        li link_to("Orders", admin_order_line_items_path(order))

      end
    end
    column :functions do |order|
      ul do
        li link_to("View", admin_order_path(order))
        li link_to("Edit", edit_admin_order_path(order.id))
        li link_to("Delete", admin_order_path(order), method: :delete, :confirm => "Are you Sure?")
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
