class AddKeywordsToCatalog < ActiveRecord::Migration
  def change
    add_column :catalogue_sections, :keywords, :string
  end
end
