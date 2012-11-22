class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :define_locale

  def define_locale
    I18n.locale = params[:locale].try(:to_sym) || I18n.default_locale
  end
end
