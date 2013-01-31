class CreateProductTypeImages < ActiveRecord::Migration
  def change
    create_table :product_type_images do |t|
      t.integer :product_type_id
      t.string :type_image

      t.timestamps
    end
  end
end