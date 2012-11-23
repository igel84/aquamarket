class CreateProductAttributes < ActiveRecord::Migration
  def self.up
    create_table :product_attributes do |t|
      t.string :name
      t.timestamps
    end
    ProductAttribute.create_translation_table! name: :string
  end

  def self.down
    drop_table :product_attributes
    ProductAttribute.drop_translation_table!
  end
end
