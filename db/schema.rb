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

ActiveRecord::Schema.define(:version => 20111123221146) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.string   "secret"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "image"
    t.string   "provider_url"
    t.string   "email"
    t.text     "yaml"
    t.string   "nickname"
  end

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
    t.string   "name",               :default => "",                           :null => false
    t.string   "short_name",         :default => "",                           :null => false
    t.string   "category",           :default => "",                           :null => false
    t.string   "country",            :default => "",                           :null => false
    t.string   "prov_state",         :default => "",                           :null => false
    t.string   "city",               :default => "",                           :null => false
    t.string   "official_url",       :default => "",                           :null => false
    t.string   "wiki_url",           :default => "",                           :null => false
    t.text     "description",                                                  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scope",              :default => "",                           :null => false
    t.text     "add_to_description",                                           :null => false
    t.string   "creator_ip",         :default => "",                           :null => false
    t.string   "adder_ip",           :default => "",                           :null => false
    t.boolean  "delta",              :default => false
    t.text     "status",                                                       :null => false
    t.string   "time_zone",          :default => "Pacific Time (US & Canada)", :null => false
    t.datetime "tallied_at",         :default => '2000-01-01 00:00:00'
    t.integer  "n_websites",         :default => 0
    t.string   "idstring",           :default => ""
  end

  add_index "communities", ["category"], :name => "index_communities_on_category"
  add_index "communities", ["city"], :name => "index_communities_on_city"
  add_index "communities", ["country"], :name => "index_communities_on_country"
  add_index "communities", ["delta"], :name => "index_communities_on_delta"
  add_index "communities", ["idstring"], :name => "index_communities_on_idstring"
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

  create_table "feedbacks", :force => true do |t|
    t.integer  "community_id"
    t.text     "comment"
    t.string   "ip_address"
    t.string   "agent"
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

  create_table "geo_ip_locations", :force => true do |t|
    t.string   "country",     :default => ""
    t.string   "region",      :default => ""
    t.string   "city",        :default => ""
    t.string   "postal_code", :default => ""
    t.float    "latitude"
    t.float    "longitude"
    t.string   "metro_code",  :default => ""
    t.string   "area_code",   :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "geo_ips", :force => true do |t|
    t.integer  "start_ip",           :limit => 8
    t.integer  "end_ip",             :limit => 8
    t.integer  "geo_ip_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "geo_ips", ["end_ip"], :name => "index_geo_ips_on_end_ip"
  add_index "geo_ips", ["geo_ip_location_id"], :name => "index_geo_ips_on_geo_ip_location_id"
  add_index "geo_ips", ["start_ip"], :name => "index_geo_ips_on_start_ip"

  create_table "ips", :force => true do |t|
    t.string   "ip_address",                      :default => ""
    t.integer  "integer_ip",         :limit => 8
    t.integer  "geo_ip_location_id"
    t.string   "country",                         :default => ""
    t.string   "region",                          :default => ""
    t.string   "city",                            :default => ""
    t.string   "postal_code",                     :default => ""
    t.float    "latitude"
    t.float    "longitude"
    t.string   "metro_code",                      :default => ""
    t.string   "area_code",                       :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ips", ["ip_address"], :name => "index_ips_on_ip_address"

  create_table "links", :force => true do |t|
    t.string   "title",       :default => ""
    t.string   "url",         :default => ""
    t.string   "category",    :default => ""
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parameters", :force => true do |t|
    t.datetime "as_of",                       :default => '2000-01-01 00:00:00'
    t.integer  "community_id",                :default => 0
    t.float    "days_full_value",             :default => 10.0
    t.float    "days_valid",                  :default => 60.0
    t.float    "ranking_formula_denominator", :default => 50.0
    t.float    "interpolation_range",         :default => 10.0
    t.float    "old_votes_weight",            :default => 0.0
    t.float    "bonus_votes",                 :default => 0.0
    t.float    "spread",                      :default => 1.0
    t.float    "spread_previous",             :default => 0.0
    t.datetime "start_voting",                :default => '2009-11-30 00:00:00'
    t.float    "float1"
    t.string   "tags",                        :default => ""
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "transition"
    t.float    "no_login_weight",             :default => 0.1
    t.float    "email_only_weight",           :default => 0.2
    t.float    "fb_login_weight",             :default => 0.5
    t.float    "email_membership_weight",     :default => 1.0
    t.float    "fb_membership_weight",        :default => 1.0
    t.float    "zone1",                       :default => 1.0
    t.float    "zone2",                       :default => 1.0
    t.float    "zone3",                       :default => 1.0
    t.float    "zone4",                       :default => 1.0
    t.float    "zone9",                       :default => 1.0
  end

  create_table "past_rankings", :force => true do |t|
    t.integer  "ranking_id"
    t.integer  "community_id"
    t.integer  "website_id"
    t.integer  "rank"
    t.datetime "tallied_at"
    t.float    "share"
    t.float    "count0"
    t.float    "count1"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "funds",        :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "award",        :precision => 10, :scale => 2, :default => 0.0
    t.string   "status",                                      :default => "",  :null => false
    t.string   "period",                                      :default => "",  :null => false
    t.date     "start"
    t.date     "end"
    t.date     "latest"
  end

  add_index "past_rankings", ["community_id", "website_id"], :name => "index_past_rankings_on_community_id_and_website_id"

  create_table "places", :force => true do |t|
    t.string   "ip_string"
    t.string   "name"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "website_id"
    t.string   "headline",   :default => ""
    t.string   "url",        :default => ""
    t.text     "body"
    t.datetime "posted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "guid",       :default => ""
    t.text     "summary"
    t.text     "show_text"
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

  create_table "proximities", :force => true do |t|
    t.integer  "community_id"
    t.string   "country",      :default => ""
    t.string   "region",       :default => ""
    t.string   "city",         :default => ""
    t.integer  "zone"
    t.datetime "start_at",     :default => '2000-01-01 00:00:00'
    t.datetime "end_at",       :default => '3000-01-01 00:00:00'
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
    t.float    "pages"
  end

  create_table "rankings", :force => true do |t|
    t.integer  "community_id"
    t.integer  "website_id"
    t.integer  "rank",         :default => 999
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "share",        :default => 0.0
    t.float    "count0",       :default => 0.0
    t.float    "count1",       :default => 0.0
    t.string   "status",       :default => "in",                  :null => false
    t.datetime "tallied_at"
    t.datetime "dropped_at",   :default => '3000-01-01 00:00:00'
  end

  add_index "rankings", ["community_id", "website_id"], :name => "index_rankings_on_community_id_and_website_id", :unique => true

  create_table "relations", :force => true do |t|
    t.integer  "community_id"
    t.string   "name",         :default => ""
    t.string   "coding",       :default => ""
    t.datetime "ended_at"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "relation_id"
    t.datetime "renewed_at"
    t.datetime "ended_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "terminals", :force => true do |t|
    t.string   "location"
    t.string   "access"
    t.string   "connect"
    t.string   "machine"
    t.string   "notes"
    t.string   "ip_address"
    t.string   "agent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                             :default => "",  :null => false
    t.string   "encrypted_password",   :limit => 128,                               :default => "",  :null => false
    t.string   "password_salt",                                                     :default => "",  :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                                     :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "member",                                                            :default => ""
    t.decimal  "permission",                          :precision => 8, :scale => 3, :default => 0.0
    t.string   "first_name",                                                        :default => "",  :null => false
    t.string   "last_name",                                                         :default => "",  :null => false
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "title",       :default => ""
    t.text     "description"
    t.string   "tags",        :default => ""
    t.string   "category",    :default => ""
    t.string   "url",         :default => ""
    t.text     "transcript"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "views", :force => true do |t|
    t.integer  "user_id"
    t.integer  "community_id"
    t.string   "ip_address",   :default => ""
    t.string   "agent",        :default => ""
    t.string   "referrer",     :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "votes", :force => true do |t|
    t.integer  "community_id"
    t.integer  "website_id"
    t.string   "ip_address",       :default => ""
    t.float    "support"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ballot_type",      :default => 0
    t.string   "agent",            :default => ""
    t.string   "place",            :default => ""
    t.float    "days"
    t.datetime "place_created_at"
    t.integer  "user_id"
    t.string   "member",           :default => ""
    t.string   "referrer",         :default => ""
    t.boolean  "fb_login",         :default => false
    t.boolean  "fb_membership",    :default => false
    t.boolean  "email_membership", :default => false
    t.integer  "zone",             :default => 0
  end

  create_table "websites", :force => true do |t|
    t.string   "url",        :default => "", :null => false
    t.string   "title",      :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "creator_ip", :default => "", :null => false
    t.string   "feed_url",   :default => "", :null => false
  end

end
