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

ActiveRecord::Schema.define(version: 20151226165642) do

  create_table "centers", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "address"
    t.string   "images"
    t.string   "geolocation"
    t.string   "phone"
    t.string   "second_phone"
    t.string   "email"
    t.string   "name"
    t.string   "description"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "main_image"
    t.float    "rate"
    t.string   "monday_friday"
    t.string   "saturday"
    t.string   "sunday"
  end

  create_table "reviews", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "center_id"
    t.string   "title"
    t.string   "comment"
    t.string   "date"
    t.float    "rate"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "email"
    t.string   "hashed_password"
    t.string   "name"
  end

end
