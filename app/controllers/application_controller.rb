class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include CategoriesHelper
  include ProductsHelper

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, :with => :render_error
    rescue_from ActiveRecord::RecordNotFound, :with => :render_not_found
    rescue_from ActionController::RoutingError, :with => :render_not_found
  end
  #
  ## called by last route matching unmatched routes.
  ## Raises RoutingError which will be rescued from in the
  ## same way as other exceptions.
  #
  def raise_not_found!
    #raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
    redirect_to root_path
  end

  rescue_from ActionView::MissingTemplate do |exception|
    exception.render "public/404"
  end

private

  def current_cart
      if session[:cart_id]
        @current_cart ||= Cart.find(session[:cart_id])
      end
      if session[:cart_id].nil?
        @current_cart = Cart.create!
        session[:cart_id] = @current_cart.id
      end
      @current_cart
  end


end
