class Api::V1::PageInfosController < Api::ApplicationController
  before_action :load_page_info, only: [:show]

  # get /api/v1/page_infos/:id (id is name or id)
  # name in %w(homepage question)
  def show
    render json: @page_info || {}
  end

  private

  def load_page_info
    @page_info = PageInfo.find_by(name: params[:id]) || PageInfo.find_by(id: params[:id])
  end
end
