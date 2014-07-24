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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140723204730) do

  create_table "shoes", force: true do |t|
    t.string   "name",                   null: false
    t.string   "category",               null: false
    t.text     "description",            null: false
    t.string   "photo",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "brand"
    t.string   "filepicker_url"
    t.string   "photo_url_file_name"
    t.string   "photo_url_content_type"
    t.integer  "photo_url_file_size"
    t.datetime "photo_url_updated_at"
  end

  add_index "shoes", ["name"], name: "index_shoes_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "username",               null: false
    t.string   "email",                  null: false
    t.string   "session_token",          null: false
    t.string   "password_digest",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "photo_url"
    t.string   "photo_url_file_name"
    t.string   "photo_url_content_type"
    t.integer  "photo_url_file_size"
    t.datetime "photo_url_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
