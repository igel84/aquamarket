class AddBodyToCatalogueSection < ActiveRecord::Migration
  def change
    add_column :catalogue_sections, :body, :text
  end
end
