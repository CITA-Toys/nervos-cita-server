class Api::ApplicationController < ActionController::API
  SUCCESS_STATUS = "success"
  ERROR_STATUS = "error"

  before_action :set_locale

  private

  def set_locale
    I18n.locale = I18n.available_locales.include?(params[:locale]&.to_sym) ? params[:locale] : I18n.default_locale
  end
end
