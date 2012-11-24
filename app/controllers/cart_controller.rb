class CartController < ApplicationController

  def add_to_cart product, quantity
    @cart = find_cart
    product = Product.find params[:id]
    @cart.add_product product, quantity
  end

  private

    def find_cart
      session[:cart] ||= Cart.new
    end

end
