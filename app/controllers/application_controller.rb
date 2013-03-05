class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_locale, :find_cart, :find_menu
  helper_method :current_locale

  def current_locale
   @locale ||= I18n.locale = params[:locale] || I18n.default_locale
  end

  private

    def find_cart
      #session[:cart] = nil
      if session[:cart] == nil 
        @cart = Cart.new
        session[:cart] = @cart
      else 
        @cart = session[:cart]
        #@cart.empty! 
      end
    end

    def find_menu
      @menu_items = MenuItem.where parent_id: nil
    end

end
