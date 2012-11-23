class AddValueToProductAttributes < ActiveRecord::Migration
  def change
    add_column :product_attributes, :value, :string
  end
end
