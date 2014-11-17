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

ActiveRecord::Schema.define(version: 20141114192115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "problems", force: true do |t|
    t.string   "description"
    t.integer  "room_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "problems", ["room_id"], name: "index_problems_on_room_id", using: :btree
  add_index "problems", ["user_id"], name: "index_problems_on_user_id", using: :btree

  create_table "registrations", force: true do |t|
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registrations", ["room_id"], name: "index_registrations_on_room_id", using: :btree
  add_index "registrations", ["user_id", "room_id"], name: "index_registrations_on_user_id_and_room_id", unique: true, using: :btree
  add_index "registrations", ["user_id"], name: "index_registrations_on_user_id", using: :btree

  create_table "rooms", force: true do |t|
    t.string   "name"
    t.string   "topic"
    t.integer  "owner_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rooms", ["name"], name: "index_rooms_on_name", unique: true, using: :btree
  add_index "rooms", ["owner_id"], name: "index_rooms_on_owner_id", using: :btree

  create_table "upvotes", force: true do |t|
    t.integer  "problem_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "upvotes", ["problem_id", "user_id"], name: "index_upvotes_on_problem_id_and_user_id", unique: true, using: :btree
  add_index "upvotes", ["problem_id"], name: "index_upvotes_on_problem_id", using: :btree
  add_index "upvotes", ["user_id"], name: "index_upvotes_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
