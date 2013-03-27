class AddAncestryToProduct < ActiveRecord::Migration
  def change
    add_column :products, :ancestry, :string
    add_column :products, :position, :integer, default:10000
    add_index :products, :ancestry
  end
end
