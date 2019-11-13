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

ActiveRecord::Schema.define(version: 20191105024446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "holiday_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["holiday_id"], name: "index_comments_on_holiday_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

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
    t.string   "image"
    t.string   "location"
    t.string   "attractions"
    t.string   "when_to_go"
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

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_memberships_on_group_id", using: :btree
    t.index ["user_id"], name: "index_memberships_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "image"
    t.string   "airport"
    t.text     "bio"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.integer  "github_id"
    t.integer  "facebook_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "comments", "holidays"
  add_foreign_key "comments", "users"
  add_foreign_key "holidays", "groups"
  add_foreign_key "holidays", "users"
  add_foreign_key "memberships", "groups"
  add_foreign_key "memberships", "users"
end
