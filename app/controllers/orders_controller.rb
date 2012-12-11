class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      redirect_to :root
    else
      render 'new'
    end
  end
end