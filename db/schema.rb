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

ActiveRecord::Schema.define(:version => 20131111131426) do

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.date     "date"
    t.integer  "verbindung_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "events_users", :force => true do |t|
    t.integer "user_id"
    t.integer "event_id"
  end

  create_table "news", :force => true do |t|
    t.text     "content"
    t.string   "title"
    t.date     "date"
    t.integer  "verbindung_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "news", ["verbindung_id"], :name => "index_news_on_verbindung_id"

  create_table "pruegel_entities", :force => true do |t|
    t.text    "content"
    t.string  "title"
    t.string  "type"
    t.integer "verbindung_id"
  end

  add_index "pruegel_entities", ["verbindung_id"], :name => "index_pruegel_entities_on_verbindung_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "cerevis"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin"
    t.boolean  "root"
    t.integer  "verbindung_id"
    t.boolean  "activated"
    t.string   "name"
    t.boolean  "approved",               :default => false, :null => false
  end

  add_index "users", ["approved"], :name => "index_users_on_approved"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "verbindungs", :force => true do |t|
    t.string   "name"
    t.string   "ort"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "first_color",       :default => "#444444", :null => false
    t.string   "second_color",      :default => "#444444", :null => false
    t.string   "third_color",       :default => "#444444", :null => false
  end

end
