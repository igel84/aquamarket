class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_locale, :find_cart
  helper_method :current_locale

  def current_locale
   @locale ||= I18n.locale = params[:locale] || I18n.default_locale
  end

  private

    def find_cart
      session[:cart] ||= Cart.new
    end

end
