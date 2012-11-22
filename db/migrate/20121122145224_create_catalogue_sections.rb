class CreateCatalogueSections < ActiveRecord::Migration
  def self.up
    create_table :catalogue_sections do |t|
      t.timestamps
    end
    CatalogueSection.create_translation_table! name: :string
  end
  def self.down
    drop_table :catalogue_sections
    CatalogueSection.drop_translation_table!
  end
end
