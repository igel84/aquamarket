class CatalogsController < ApplicationController
  def index
    @catalogue_sections = CatalogueSection.all
  end

  def show
    @catalogue_section = CatalogueSection.find params[:id]
  end
end
