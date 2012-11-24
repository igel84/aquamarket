class CartController < ApplicationController

  def add_to_cart(product=params[:cart_item][:product_id], quantity=params[:cart_item][:quantity])
    @cart = find_cart
    @product = Product.find product
    @cart.add_product(@product, quantity)
    redirect_to :back
  end

end
