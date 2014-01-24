class SalesRulesController < ApplicationController

  before_filter :current_admin_user, :only => [:new, :create, :edit, :destroy, :update]
  before_action :all_categories, :only => [:new, :index, :edit, :show, :create]
  before_action :show_products, :only => [:index]

  def index
    @sale_rule = SalesRule.all
    @cart = current_cart
  end

  def create
    @sale_rule = SalesRule.new(sale_params)
    if @sale_rule.save
      redirect_to root_path
    end
  end


  def sale_params
    params.require(:sales_rules).permit(:description)
  end
end
