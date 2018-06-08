class PageInfosController < ApplicationController
  before_action :set_page_info, only: [:show, :edit, :update, :destroy]

  # GET /page_infos
  # GET /page_infos.json
  def index
    @page_infos = PageInfo.all
  end

  # GET /page_infos/1
  # GET /page_infos/1.json
  def show
  end

  # GET /page_infos/new
  def new
    @page_info = PageInfo.new
  end

  # GET /page_infos/1/edit
  def edit
  end

  # POST /page_infos
  # POST /page_infos.json
  def create
    @page_info = PageInfo.new(page_info_params)
    @page_info.content = content_param

    respond_to do |format|
      if @page_info.save
        format.html { redirect_to @page_info, notice: 'Page info was successfully created.' }
        format.json { render :show, status: :created, location: @page_info }
      else
        format.html { render :new }
        format.json { render json: @page_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /page_infos/1
  # PATCH/PUT /page_infos/1.json
  def update
    respond_to do |format|
      if @page_info.update(name: params[:page_info][:name], locale: params[:page_info][:locale], content: content_param)
        format.html { redirect_to @page_info, notice: 'Page info was successfully updated.' }
        format.json { render :show, status: :ok, location: @page_info }
      else
        format.html { render :edit }
        format.json { render json: @page_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /page_infos/1
  # DELETE /page_infos/1.json
  def destroy
    @page_info.destroy
    respond_to do |format|
      format.html { redirect_to page_infos_url, notice: 'Page info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page_info
      @page_info = PageInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_info_params
      params.require(:page_info).permit(:name, :locale)
    end

    def content_param
      Oj.load(params[:page_info][:content])
    rescue
      nil
    end
end
