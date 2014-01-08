class StaticPagesController < ApplicationController

  before_filter :current_admin_user, :only => [:new, :create, :edit, :destroy, :update]
end
