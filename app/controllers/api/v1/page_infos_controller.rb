class Api::V1::PageInfosController < Api::ApplicationController
  before_action :load_page_info, only: [:show]

  # get /api/v1/page_infos/:id (id is name or id)
  # name in %w(homepage question)
  def show
    if @page_info
      render json: {
        status: SUCCESS_STATUS,
        data: @page_info
      }
    else
      render json: {
        status: ERROR_STATUS,
        message: I18n.t("page_infos.api.v1.not_found")
      }
    end
  end

  private

  def load_page_info
    locale = lode_locale
    @page_info = PageInfo.find_by(name: params[:id], locale: locale) ||
      PageInfo.find_by(id: params[:id], locale: locale)
  end

  # params[:info_locale] will overwrite locale column
  def lode_locale
    params[:info_locale] || I18n.locale
  end
end
