class MessagesController < ApplicationController

  #before_filter :current_admin_user, :only => [:new, :create, :edit, :destroy, :update]
  before_action :all_categories, :only => [:new, :index, :edit, :show, :create]
  before_action :show_products, :only => [:index]

  def new
    @cart = current_cart
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    if @message.valid?
      flash[:success] = "Сообщение отправленно"
      redirect_to root_path
    else
      render :new
    end
  end

  def message_params
    params.require(:message).permit(:name, :email, :content)
  end
end
