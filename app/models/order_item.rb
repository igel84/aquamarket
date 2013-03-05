class OrderItem < ActiveRecord::Base
  attr_accessible :order_id, :product_id, :product_type_id, :quantity, :price, :summ
  belongs_to :order
  belongs_to :product
  belongs_to :product_type

  def to_s
    'sdfsd'
  end
end
