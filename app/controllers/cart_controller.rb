class CartController < ApplicationController

  def add_to_cart product
    @cart = find_cart
    product = Product.find params[:id]
    @cart.add_product product
  end

  private

    def find_cart
      session[:cart] ||= Cart.new
    end

end
