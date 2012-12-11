class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :quantity, :price, :summ
  belongs_to :order
  belongs_to :product
end
