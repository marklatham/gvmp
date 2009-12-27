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

ActiveRecord::Schema.define(:version => 20091227201503) do

  create_table "clippings", :force => true do |t|
    t.date     "date_sequence"
    t.string   "date_text"
    t.string   "source"
    t.string   "source_url"
    t.string   "author"
    t.string   "title"
    t.string   "title_url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.text     "add_to_description"
    t.string   "creator_ip"
    t.string   "adder_ip"
    t.boolean  "delta",              :default => false
    t.text     "status"
  end

  add_index "communities", ["category"], :name => "index_communities_on_category"
  add_index "communities", ["city"], :name => "index_communities_on_city"
  add_index "communities", ["country"], :name => "index_communities_on_country"
  add_index "communities", ["delta"], :name => "index_communities_on_delta"
  add_index "communities", ["name"], :name => "index_communities_on_name"
  add_index "communities", ["prov_state"], :name => "index_communities_on_prov_state"
  add_index "communities", ["scope"], :name => "index_communities_on_scope"
  add_index "communities", ["short_name"], :name => "index_communities_on_short_name"

  create_table "faqs", :force => true do |t|
    t.string   "category"
    t.float    "sequence"
    t.float    "importance"
    t.string   "question"
    t.text     "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fundings", :force => true do |t|
    t.date     "date"
    t.integer  "community_id"
    t.decimal  "amount",       :precision => 10, :scale => 2, :default => 0.0
    t.float    "allocated",                                   :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fundings", ["community_id"], :name => "index_fundings_on_community_id"

  create_table "past_rankings", :force => true do |t|
    t.integer  "ranking_id"
    t.integer  "community_id"
    t.integer  "website_id"
    t.integer  "rank"
    t.datetime "ranking_updated_at"
    t.float    "share"
    t.float    "count0"
    t.float    "count1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "funds",              :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "award",              :precision => 10, :scale => 2, :default => 0.0
  end

  add_index "past_rankings", ["community_id", "website_id"], :name => "index_past_rankings_on_community_id_and_website_id"

  create_table "posts", :force => true do |t|
    t.integer  "website_id"
    t.string   "headline"
    t.string   "url"
    t.text     "body"
    t.datetime "posted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid"
    t.text     "summary"
  end

  add_index "posts", ["website_id"], :name => "index_posts_on_website_id"

  create_table "presentations", :force => true do |t|
    t.date     "pdate"
    t.string   "place"
    t.string   "host"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposals", :force => true do |t|
    t.date     "date_submitted"
    t.date     "date_agm"
    t.string   "company"
    t.string   "company_url"
    t.string   "ticker"
    t.string   "proposal_type"
    t.string   "proposal_url"
    t.text     "correspondence"
    t.string   "proxy_url"
    t.boolean  "in_proxy"
    t.float    "yes_percent"
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
    t.integer  "rank",         :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "share",        :default => 0.0
    t.float    "count0",       :default => 0.0
    t.float    "count1",       :default => 0.0
  end

  add_index "rankings", ["community_id", "website_id"], :name => "index_rankings_on_community_id_and_website_id", :unique => true

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100,                               :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.decimal  "permission",                               :precision => 8, :scale => 3, :default => 0.0
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

  create_table "votes", :force => true do |t|
    t.string   "ip_address"
    t.integer  "community_id"
    t.integer  "website_id"
    t.float    "support"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ballot_type",  :default => 0
    t.string   "agent"
  end

  create_table "websites", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "creator_ip"
    t.string   "feed_url"
  end

end
