class ContactsController < ApplicationController

  before_action :set_category, :only => [:show, :edit, :update, :destroy]
  before_action :all_categories, :only => [:new, :index, :edit, :show, :create]
  before_action :show_products, :only => [:index, :show]

  def new
    @cart = current_cart
    @contact = Contact.new
  end

  def create
    @cart = current_cart
    @contact = Contact.new(contact_params)
    @contact.request = request
    if @contact.deliver
      redirect_to root_path, :notice => "Сообщение отправленно"
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
