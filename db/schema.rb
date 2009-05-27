# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090526215721) do

  create_table "colleagues", :force => true do |t|
    t.string   "given_name"
    t.string   "family_name"
    t.string   "role"
    t.string   "email"
    t.string   "photo"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "sequence"
  end

  create_table "communities", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "category"
    t.string   "country"
    t.string   "prov_state"
    t.string   "city"
    t.string   "official_url"
    t.string   "wiki_url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scope"
  end

  create_table "faqs", :force => true do |t|
    t.string   "category"
    t.float    "sequence"
    t.float    "importance"
    t.string   "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pubs", :force => true do |t|
    t.date     "date_sequence"
    t.string   "date_text"
    t.string   "title"
    t.string   "country"
    t.string   "journal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rankings", :force => true do |t|
    t.integer  "community_id"
    t.integer  "website_id"
    t.float    "rank",         :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rankings", ["community_id", "website_id"], :name => "index_rankings_on_community_id_and_website_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.boolean  "admin_user",                               :default => false, :null => false
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "votes", :force => true do |t|
    t.string   "ip_address"
    t.integer  "community_id"
    t.integer  "website_id"
    t.float    "support"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "websites", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
