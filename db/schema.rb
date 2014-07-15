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

ActiveRecord::Schema.define(version: 20140715222302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: true do |t|
    t.string   "name"
    t.decimal  "abv",              precision: 3, scale: 1
    t.integer  "brewery_id"
    t.integer  "ibu"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "average_rating",                           default: 0.0
    t.integer  "drinks_count"
    t.float    "controversiality"
    t.string   "style"
    t.string   "hops"
    t.string   "location"
    t.text     "description"
  end

  create_table "breweries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drinks", force: true do |t|
    t.integer  "beer_id"
    t.integer  "user_id"
    t.integer  "volume"
    t.integer  "session"
    t.float    "rating"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "nickname"
    t.string   "password"
    t.string   "email"
  end

  add_index "users", ["uid"], name: "index_users_on_uid", unique: true, using: :btree

end
