class AddProductTypeToOrderItem < ActiveRecord::Migration
  def change
    add_column :order_items, :product_type_id, :integer
  end
end
