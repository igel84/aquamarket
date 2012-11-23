# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121123175237) do

  create_table "article_translations", :force => true do |t|
    t.integer  "article_id"
    t.string   "locale"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "article_translations", ["article_id"], :name => "index_article_translations_on_article_id"
  add_index "article_translations", ["locale"], :name => "index_article_translations_on_locale"

  create_table "articles", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "catalogue_section_translations", :force => true do |t|
    t.integer  "catalogue_section_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "catalogue_section_translations", ["catalogue_section_id"], :name => "index_b6e872666f9568af94f09a51977fcff7980683d6"
  add_index "catalogue_section_translations", ["locale"], :name => "index_catalogue_section_translations_on_locale"

  create_table "catalogue_sections", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "gritter_notices", :force => true do |t|
    t.integer  "owner_id",     :null => false
    t.string   "owner_type",   :null => false
    t.text     "text",         :null => false
    t.text     "options",      :null => false
    t.datetime "delivered_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gritter_notices", ["owner_id", "delivered_at"], :name => "index_gritter_notices_on_owner_id_and_delivered_at"

  create_table "product_attribute_translations", :force => true do |t|
    t.integer  "product_attribute_id"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "product_attribute_translations", ["locale"], :name => "index_product_attribute_translations_on_locale"
  add_index "product_attribute_translations", ["product_attribute_id"], :name => "index_794d67e3f767e4884c1d2d024fc265d1109a9033"

  create_table "product_attributes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "value"
  end

  create_table "product_images", :force => true do |t|
    t.integer  "product_id"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "product_translations", :force => true do |t|
    t.integer  "product_id"
    t.string   "locale"
    t.string   "name"
    t.text     "preview"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "product_translations", ["locale"], :name => "index_product_translations_on_locale"
  add_index "product_translations", ["product_id"], :name => "index_product_translations_on_product_id"

  create_table "products", :force => true do |t|
    t.integer  "catalogue_section_id"
    t.decimal  "price",                :precision => 10, :scale => 0
    t.decimal  "discount_price",       :precision => 10, :scale => 0
    t.integer  "quantity"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "art"
    t.text     "product_attributes"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "role_users", :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
