class AddUrlToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :url, :string
    add_column :brands, :keywords, :string
  end
end
