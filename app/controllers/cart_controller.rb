class CartController < ApplicationController

  def index
    
  end

  def add_to_cart(product=params[:cart_item][:product_id], product_type=params[:cart_item][:product_type_id], quantity=params[:cart_item][:quantity])
    @cart = find_cart
    @product = Product.find product
    if product_type.nil? 
      @cart.add_product(@product, nil, quantity)
    else 
      @cart.add_product(@product, ProductType.find(product_type), quantity)
    end    
    respond_to do |format|
      format.js #{ render js: "$('#tiendaUserShoppingCart').html('');" }
      format.html { redirect_to :back }
    end
  end

  def conversion
    if params[:product_type].nil?
      @cart.conversion(Product.find(params[:product]), nil, params[:quantity])    
    else
      @cart.conversion(Product.find(params[:product]), ProductType.find(params[:product_type]), params[:quantity])    
    end
    #redirect_to :back
  end  

  def destroy_cart_item    
    @cart.destroy_item(params[:product], params[:product_type])    
    redirect_to :back    
  end

end
