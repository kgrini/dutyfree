class SalesRulesController < ApplicationController

  before_filter :current_admin_user, :only => [:new, :create, :edit, :destroy, :update]
  before_action :all_categories, :only => [:new, :index, :edit, :show, :create]
  before_action :show_products, :only => [:index]

  def index
    @items = LineItem.where("order_id = ?", 6)
    @cart = current_cart
  end

end
