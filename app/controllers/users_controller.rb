class UsersController < ApplicationController

  before_filter :authenticate_admin_user!, :only => [:new, :create, :edit, :update, :destroy, :index]
  before_action :set_user, :only => [:show, :edit, :update, :destroy]

  def index

  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def edit
  end

  def update
    @user.update_attributes(user_params)
    if @user.save
      redirect_to categories_path
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User was deleted"
    redirect_to categories_path
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
