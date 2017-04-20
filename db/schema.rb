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

ActiveRecord::Schema.define(version: 20170420154921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "creator_id"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "group_id", null: false
  end

  create_table "holidays", force: :cascade do |t|
    t.string   "cover_photo"
    t.string   "location"
    t.string   "attractions"
    t.string   "when_to_go"
    t.text     "description"
    t.string   "image_one"
    t.string   "image_two"
    t.string   "image_three"
    t.string   "image_four"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "group_id"
    t.date     "departureDate"
    t.date     "returnDate"
    t.string   "departureAirport"
    t.string   "arrivalAirport"
    t.index ["group_id"], name: "index_holidays_on_group_id", using: :btree
    t.index ["user_id"], name: "index_holidays_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.string   "image"
    t.string   "airport"
    t.text     "bio"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.integer  "github_id"
  end

  add_foreign_key "holidays", "groups"
  add_foreign_key "holidays", "users"
end
