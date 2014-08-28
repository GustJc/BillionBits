class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
 
  def set_locale
    logger.debug "SET LOCALE: #{locale}\n"
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    { :locale => ((I18n.locale == I18n.default_locale) ? nil : I18n.locale) }
  end
end
