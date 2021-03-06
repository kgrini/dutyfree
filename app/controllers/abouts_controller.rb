class AboutsController < ApplicationController

  before_filter :current_admin_user, :only => [:new, :create, :edit, :destroy, :update]
  before_action :all_categories, :only => [:new, :index, :edit, :show, :create]
  before_action :show_products, :only => [:index]

  def index
    @about_message = About.first
    @cart = current_cart
  end

end
