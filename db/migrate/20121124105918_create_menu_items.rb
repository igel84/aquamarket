class CreateMenuItems < ActiveRecord::Migration
  def self.up
    create_table :menu_items do |t|
      t.string :url
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth
      t.timestamps
    end
    MenuItem.create_translation_table! name: :string
  end

  def self.down
    drop_table :menu_items
    MenuItem.drop_translation_table!
  end
end
