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

ActiveRecord::Schema.define(:version => 20130801044037) do

  create_table "auctions", :force => true do |t|
    t.string   "descrip"
    t.string   "title"
    t.string   "category"
    t.string   "img_url"
    t.string   "pat_num"
    t.decimal  "cost"
    t.integer  "timer_hr"
    t.string   "timer_min"
    t.string   "integer"
    t.integer  "timer_day"
    t.string   "pat_type"
    t.string   "lic_or_sell"
    t.text     "pat_off_desc"
    t.integer  "user_id"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "pic1_file_name"
    t.string   "pic1_content_type"
    t.integer  "pic1_file_size"
    t.datetime "pic1_updated_at"
    t.string   "pic2_file_name"
    t.string   "pic2_content_type"
    t.integer  "pic2_file_size"
    t.datetime "pic2_updated_at"
    t.string   "pic3_file_name"
    t.string   "pic3_content_type"
    t.integer  "pic3_file_size"
    t.datetime "pic3_updated_at"
    t.string   "pic4_file_name"
    t.string   "pic4_content_type"
    t.integer  "pic4_file_size"
    t.datetime "pic4_updated_at"
    t.string   "pic5_file_name"
    t.string   "pic5_content_type"
    t.integer  "pic5_file_size"
    t.datetime "pic5_updated_at"
    t.string   "pic_descr_1"
    t.string   "pic_descr_2"
    t.string   "pic_descr_3"
    t.string   "pic_descr_4"
    t.string   "pic_descr_5"
    t.boolean  "goog_url",           :default => false
    t.text     "why_sell"
    t.string   "phone_num"
    t.string   "user_name"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.string   "slug"
    t.string   "vid_url"
    t.string   "cat_search"
    t.integer  "business_buy_id"
    t.string   "business_buy_name"
  end

  add_index "auctions", ["slug"], :name => "index_auctions_on_slug", :unique => true

  create_table "convers", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "convers", ["receiver_id"], :name => "index_convers_on_receiver_id"
  add_index "convers", ["sender_id", "receiver_id"], :name => "index_convers_on_sender_id_and_receiver_id", :unique => true
  add_index "convers", ["sender_id"], :name => "index_convers_on_sender_id"

  create_table "filings", :force => true do |t|
    t.string   "milestone_title"
    t.text     "milestone_content"
    t.boolean  "milestone_success"
    t.boolean  "milestone_on_time"
    t.boolean  "milestone_late"
    t.integer  "milestone_timer"
    t.boolean  "minestone_user_accept"
    t.boolean  "user_accept_filing"
    t.integer  "pay_per_milestone"
    t.string   "filing_title"
    t.text     "filing_content"
    t.integer  "user_current_filing_amount"
    t.integer  "user_success_filing"
    t.string   "filing_user_name"
    t.string   "filing_lawyer_name"
    t.string   "job_category"
    t.string   "job_descrip"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "slug"
    t.integer  "user_id"
    t.integer  "lawyer_id"
    t.string   "user_name"
    t.string   "lawyer_name"
  end

  add_index "filings", ["slug"], :name => "index_filings_on_slug", :unique => true

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "messengers", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.boolean  "sender_deleted",              :default => false
    t.boolean  "recipient_deleted",           :default => false
    t.string   "subject"
    t.text     "body"
    t.datetime "read_at"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.string   "message_attach_file_name"
    t.string   "message_attach_content_type"
    t.integer  "message_attach_file_size"
    t.datetime "message_attach_updated_at"
    t.integer  "user_messenger_id"
  end

  create_table "microposts", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "search_suggestions", :force => true do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "searches", :force => true do |t|
    t.string   "keywords"
    t.string   "catg"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "searches", ["slug"], :name => "index_searches_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "remember_token"
    t.boolean  "admin",                :default => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "lawyer",               :default => false
    t.string   "firm"
    t.integer  "years_practicing"
    t.integer  "billable_hours"
    t.string   "firm_site"
    t.integer  "billable_rate"
    t.integer  "pat_bar_num"
    t.boolean  "agent_or_lawyer",      :default => false
    t.string   "slug"
    t.integer  "pat_buy",              :default => 0
    t.integer  "pat_sold",             :default => 0
    t.integer  "pat_selling",          :default => 0
    t.string   "sex",                  :default => "undefined"
    t.string   "password_digest"
    t.boolean  "business"
    t.string   "biz"
    t.string   "biz_site"
    t.string   "biz_position"
    t.boolean  "hidden"
    t.integer  "card_num"
    t.integer  "exp_month"
    t.integer  "exp_year"
    t.integer  "verify_code"
    t.string   "card_first_name"
    t.string   "card_last_name"
    t.integer  "charge_amount_dollar"
    t.integer  "charge_amount_cents"
    t.string   "card_type"
    t.integer  "my_fee_dollars"
    t.integer  "my_fee_cents"
    t.string   "ip_address"
    t.integer  "charge_amount_total"
    t.integer  "my_fee_total"
    t.string   "card_address"
    t.string   "card_city"
    t.string   "card_state"
    t.string   "card_country"
    t.integer  "card_zip"
    t.string   "trans_id"
    t.string   "usr_name"
    t.string   "biz_law",              :default => "user"
    t.string   "firm_agent_lawyer",    :default => "lawyer"
    t.string   "pat_cat"
    t.text     "biz_descrip"
    t.text     "firm_descrip"
    t.text     "user_descrip"
    t.boolean  "biz_or_person"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

end
