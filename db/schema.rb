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

ActiveRecord::Schema.define(:version => 20100320213750) do

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
    t.string   "status"
    t.string   "period"
    t.date     "start"
    t.date     "end"
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
    t.integer  "rank",         :default => 999
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "share",        :default => 0.0
    t.float    "count0",       :default => 0.0
    t.float    "count1",       :default => 0.0
    t.string   "status",       :default => "in"
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

  create_table "ubc1", :id => false, :force => true do |t|
    t.integer "President_Bijan_Ahmadian"
    t.integer "President_Sean_Kim"
    t.integer "President_Pak_Ho_Leung"
    t.integer "President_Natalie_Swift"
    t.integer "VP_Academic_Ben_Cappellacci"
    t.integer "VP_Academic_Rodrigo_Ferrari-Nunes"
    t.integer "VP_Finance_The_Invisible_Man"
    t.integer "VP_Finance_Elin_Tayyer"
    t.integer "VP_Admin_Ekaterina_Dovjenko"
    t.integer "VP_Admin_Michael_Haack"
    t.integer "VP_External_Timothy_Chu"
    t.integer "VP_External_Jeremy_McElroy"
    t.integer "VP_External_Aaron_Palm"
    t.integer "VP_External_Stas_Pavlov"
    t.float   "VFM_AMS_Confidential"
    t.float   "VFM_Geoffs_Place"
    t.float   "VFM_The_Radical_Beer_Tribune"
    t.float   "VFM_Social_Capital"
    t.float   "VFM_UBC_Insiders"
    t.float   "VFM_The_UBC_Spectator"
    t.string  "Stamp_ip_address"
    t.string  "Stamp_time"
  end

  create_table "ubc1all", :id => false, :force => true do |t|
    t.integer  "President_Bijan_Ahmadian"
    t.integer  "President_Sean_Kim"
    t.integer  "President_Pak_Ho_Leung"
    t.integer  "President_Natalie_Swift"
    t.integer  "VP_Academic_Ben_Cappellacci"
    t.integer  "VP_Academic_Rodrigo_Ferrari-Nunes"
    t.integer  "VP_Finance_The_Invisible_Man"
    t.integer  "VP_Finance_Elin_Tayyer"
    t.integer  "VP_Admin_Ekaterina_Dovjenko"
    t.integer  "VP_Admin_Michael_Haack"
    t.integer  "VP_External_Timothy_Chu"
    t.integer  "VP_External_Jeremy_McElroy"
    t.integer  "VP_External_Aaron_Palm"
    t.integer  "VP_External_Stas_Pavlov"
    t.binary   "International_Se_Won_An",           :limit => 1
    t.binary   "International_Ding_Kun",            :limit => 1
    t.binary   "International_Brittany_Perna",      :limit => 1
    t.binary   "BoG_Blake_Frederick",               :limit => 1
    t.binary   "BoG_Sean_Heisler",                  :limit => 1
    t.binary   "BoG_Guillaume_Houle",               :limit => 1
    t.binary   "BoG_Azim_Wazeer",                   :limit => 1
    t.binary   "Senate_Nader_Beyzaei",              :limit => 1
    t.binary   "Senate_Ryan_Bredin",                :limit => 1
    t.binary   "Senate_Blake_Frederick",            :limit => 1
    t.binary   "Senate_AJ_Hajir_Hajian",            :limit => 1
    t.binary   "Senate_Alyssa_Koehn",               :limit => 1
    t.binary   "Senate_Blair_McRadu",               :limit => 1
    t.binary   "Senate_Jol_Mertens",                :limit => 1
    t.binary   "Senate_Spencer_Rasmussen",          :limit => 1
    t.binary   "Senate_Johannes_Rebane",            :limit => 1
    t.binary   "Senate_Aminollah_Sabzevari",        :limit => 1
    t.binary   "Senate_Miriam_Sabzevari",           :limit => 1
    t.binary   "Senate_Gary_Tse",                   :limit => 1
    t.binary   "Chair_Ubyssey_Campbell_Bryson_YES", :limit => 1
    t.binary   "Ubyssey_Neil_Andrews",              :limit => 1
    t.binary   "Ubyssey_Sandy_Buchanan",            :limit => 1
    t.binary   "Ubyssey_Blake_Frederick",           :limit => 1
    t.binary   "Ubyssey_Imran_Habib",               :limit => 1
    t.binary   "Ubyssey_Oliver_Thorne",             :limit => 1
    t.binary   "SLFS_Slavash_Ahmadi",               :limit => 1
    t.binary   "SLFS_Omid_Atai",                    :limit => 1
    t.binary   "SLFS_Anthony_Bryson",               :limit => 1
    t.binary   "SLFS_Paul_J_Godin",                 :limit => 1
    t.binary   "SLFS_JJ_Maclean",                   :limit => 1
    t.binary   "SLFS_Alexander_Shalashniy",         :limit => 1
    t.binary   "SLFS_Aaron_Sihota",                 :limit => 1
    t.binary   "SLFS_Hillson_Tse",                  :limit => 1
    t.float    "VFM_AMS_Confidential"
    t.float    "VFM_Geoffs_Place"
    t.float    "VFM_The_Radical_Beer_Tribune"
    t.float    "VFM_Social_Capital"
    t.float    "VFM_UBC_Insiders"
    t.float    "VFM_The_UBC_Spectator"
    t.binary   "Referenda_refs1",                   :limit => 1
    t.binary   "Referenda_refs2",                   :limit => 1
    t.binary   "Referenda_refs3",                   :limit => 1
    t.binary   "Referenda_refs4",                   :limit => 1
    t.binary   "Referenda_refs5",                   :limit => 1
    t.binary   "Referenda_refs6",                   :limit => 1
    t.binary   "Referenda_refs7",                   :limit => 1
    t.binary   "Referenda_refs8",                   :limit => 1
    t.binary   "Referenda_refs9",                   :limit => 1
    t.binary   "Chair_Ubyssey_Campbell_Bryson_NO",  :limit => 1
    t.binary   "Referenda_refs1NO",                 :limit => 1
    t.binary   "Referenda_refs2NO",                 :limit => 1
    t.binary   "Referenda_refs3NO",                 :limit => 1
    t.binary   "Referenda_refs4NO",                 :limit => 1
    t.binary   "Referenda_refs5NO",                 :limit => 1
    t.binary   "Referenda_refs6NO",                 :limit => 1
    t.binary   "Referenda_refs7NO",                 :limit => 1
    t.binary   "Referenda_refs8NO",                 :limit => 1
    t.binary   "Referenda_refs9NO",                 :limit => 1
    t.string   "Stamp_ip_address"
    t.datetime "Stamp_time"
  end

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
    t.integer  "community_id"
    t.integer  "website_id"
    t.string   "ip_address"
    t.float    "support"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ballot_type",  :default => 0
    t.string   "agent"
    t.string   "place"
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
