class PageVersionsController < ApplicationController
  before_filter :set_objects

  def index
    @page_versions = @page.page_versions
  end
  
  def new
    @page_version = @page.page_versions.build
  end

  def show
  end

  def create
    @page_version = @page.page_versions.build(params[:page_version])

    if @page_version.save
      redirect_to [@prototype, @page], notice: 'Page version was successfully created.'
    else
      render action: "new"
    end
  end

  private

  def set_objects
    @prototype = Prototype.find_by_permalink!(params[:prototype_id])
    @page = @prototype.pages.find(params[:page_id])
    @page_version = @page.page_versions.find(params[:id]) if params[:id]
  end
end
