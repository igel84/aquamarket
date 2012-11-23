class CatalogsController < ApplicationController
  def index
    @catalogue_sections = CatalogueSection.includes :products
  end

  def show
    @catalogue_section = CatalogueSection.includes(:products).find(params[:id])
  end
end
