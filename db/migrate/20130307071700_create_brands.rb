class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name
      t.text :info
      t.string :logo
      t.timestamps
    end
  end
end
