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

ActiveRecord::Schema.define(:version => 20130613172104) do

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
    t.string   "vid"
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
    t.string   "vid_url"
    t.string   "user_name"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.string   "slug"
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

  create_table "conversations", :force => true do |t|
    t.string   "subject",    :default => ""
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

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
    t.boolean  "sender_deleted",    :default => false
    t.boolean  "recipient_deleted", :default => false
    t.string   "subject"
    t.text     "body"
    t.datetime "read_at"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "microposts", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "notifications", :force => true do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              :default => ""
    t.integer  "sender_id"
    t.string   "sender_type"
    t.integer  "conversation_id"
    t.boolean  "draft",                :default => false
    t.datetime "updated_at",                              :null => false
    t.datetime "created_at",                              :null => false
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "notification_code"
    t.string   "attachment"
    t.boolean  "global",               :default => false
    t.datetime "expires"
  end

  add_index "notifications", ["conversation_id"], :name => "index_notifications_on_conversation_id"

  create_table "receipts", :force => true do |t|
    t.integer  "receiver_id"
    t.string   "receiver_type"
    t.integer  "notification_id",                                  :null => false
    t.boolean  "is_read",                       :default => false
    t.boolean  "trashed",                       :default => false
    t.boolean  "deleted",                       :default => false
    t.string   "mailbox_type",    :limit => 25
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "receipts", ["notification_id"], :name => "index_receipts_on_notification_id"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "remember_token"
    t.boolean  "admin",               :default => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "lawyer",              :default => false
    t.string   "firm"
    t.integer  "years_practicing"
    t.integer  "billable_hours"
    t.string   "firm_site"
    t.integer  "billable_rate"
    t.integer  "pat_bar_num"
    t.boolean  "agent_or_lawyer",     :default => false
    t.string   "password_digest"
    t.string   "slug"
    t.integer  "pat_buy",             :default => 0
    t.integer  "pat_sold",            :default => 0
    t.integer  "pat_selling",         :default => 0
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

end
