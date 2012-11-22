class CreateProducts < ActiveRecord::Migration
  
  def self.up
    create_table :products do |t|
      t.integer :catalogue_section_id
      t.decimal :price
      t.decimal :discount_price
      t.integer :quantity
      t.timestamps
    end
    Product.create_translation_table! name: :string, preview: :text, description: :text
  end

  def self.down
    drop_table :products
    Product.drop_translation_table!
  end

end
