class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_locale
  helper_method :current_locale

  def current_locale
   @locale ||= I18n.locale = params[:locale] || I18n.default_locale
  end

  private
    
    def current_cart
    end

end
