class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    unless @cart.empty?
      @order = Order.new(params[:order])
      @cart.items.each do |item|
        @order.order_items << OrderItem.new(
          product_id: item.product.id, 
          product_type_id: item.product_type.try(:id), 
          quantity: item.quantity, 
          price: item.product.full_price, 
          summ: item.price)
      end
      if @order.save
        OrderMailer.order_email(@order).deliver
        @cart.empty!
        #redirect_to :root
        render :action => "success"
      else
        render 'new'
      end
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def print
    @order = Order.find(params[:id])
    render 'print', layout: false
  end

end