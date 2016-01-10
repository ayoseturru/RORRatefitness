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

ActiveRecord::Schema.define(version: 20160110195216) do

  create_table "administrators", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "adverts", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.string   "description"
    t.string   "date"
    t.integer  "user_id"
  end

  create_table "center_images", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "center_id"
    t.string   "integer"
  end

  create_table "centers", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "address"
    t.string   "phone"
    t.string   "second_phone"
    t.string   "email"
    t.string   "name"
    t.string   "description"
    t.string   "latitude"
    t.string   "longitude"
    t.float    "rate"
    t.string   "monday_friday"
    t.string   "saturday"
    t.string   "sunday"
    t.string   "municipality"
    t.string   "price"
    t.string   "aerobic"
    t.string   "fitness"
    t.string   "zumba"
    t.string   "aquagym"
    t.string   "tennis"
    t.integer  "user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
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
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "email"
    t.string   "hashed_password"
    t.string   "name"
    t.string   "municipality"
    t.string   "role"
  end

end
