class ContactsController < ApplicationController

  before_action :all_categories, :only => [:new, :index, :edit, :show, :create]
  before_action :show_products, :only => [:index, :show]

  def new
    @cart = current_cart
    @contact = Contact.new
  end

  def create
    @message = Contact.new(contacts_params)
  end

  def contacts_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
