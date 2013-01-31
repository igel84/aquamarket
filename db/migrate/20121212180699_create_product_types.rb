#encoding: utf-8
class CreateProductTypes < ActiveRecord::Migration
  def change
    create_table :product_types do |t|
      t.integer :product_id
      t.string :name
      t.decimal :price
      t.timestamps
    end
  end
end