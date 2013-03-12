class BrandsController < ApplicationController
  def show
    @brand = Brand.find params[:id]
    @product_list = @brand.products
  end
end
