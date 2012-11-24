class CreateProducts < ActiveRecord::Migration
  
  def self.up
    create_table :products do |t|
      t.string :name
      t.text :preview
      t.text :description
      t.integer :catalogue_section_id
      t.decimal :price
      t.decimal :discount_price
      t.integer :quantity
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end

end
