class ProductsController < ApplicationController
  def show
    @product = Product.includes(:catalogue_section).find params[:id]
  end

  def find_product
    @products = Product.includes(:catalogue_section).where("name like ?", "%#{params[:product_name]}%")
  end
end
