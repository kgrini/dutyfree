class StaticPagesController < ApplicationController

  before_filter :current_admin_user, :only => [:new, :create, :edit, :destroy, :update]

  def index
    @categories = Category.all
    @products = Product.order(:created_at)
  end
end
