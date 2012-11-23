class AddProductAttributesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :product_attributes, :text
  end
end
