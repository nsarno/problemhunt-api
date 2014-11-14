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

ActiveRecord::Schema.define(version: 20141114171507) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "problems", force: true do |t|
    t.string   "description"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "problems", ["room_id"], name: "index_problems_on_room_id", using: :btree

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rooms", ["name"], name: "index_rooms_on_name", unique: true, using: :btree

  create_table "rooms_users", id: false, force: true do |t|
    t.integer "user_id", null: false
    t.integer "room_id", null: false
  end

  add_index "rooms_users", ["user_id", "room_id"], name: "index_rooms_users_on_user_id_and_room_id", unique: true, using: :btree

  create_table "upvotes", id: false, force: true do |t|
    t.integer "problem_id", null: false
    t.integer "user_id",    null: false
  end

  add_index "upvotes", ["problem_id", "user_id"], name: "index_upvotes_on_problem_id_and_user_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
