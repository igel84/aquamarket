class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.timestamps
    end
    Article.create_translation_table! title: :string, body: :text
  end

  def self.down
    drop_table :articles
    Article.drop_translation_table!
  end
end
