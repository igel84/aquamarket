class CreatePromotions < ActiveRecord::Migration
  def change
    create_table :promotions do |t|
      t.integer :product_id
      t.string :kind
      t.integer :value
      t.datetime :start_at
      t.datetime :finish_at
      t.string :info

      t.timestamps
    end
  end
end
