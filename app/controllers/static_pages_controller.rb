class StaticPagesController < ApplicationController

  before_filter :current_admin_user, :only => [:new, :create, :edit, :destroy, :update]

  def index
    @categories = Category.all
  end
end
