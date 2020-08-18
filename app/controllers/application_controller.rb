class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_locale
  before_action :require_logged_in

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def require_logged_in
    return if logged_in?

    redirect_to login_path locale
  end

  def self.default_url_options
    {locale: I18n.locale}
  end
end
