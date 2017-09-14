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

ActiveRecord::Schema.define(version: 20170910175228) do

  create_table "articles", force: :cascade do |t|
    t.string   "name"
    t.integer  "prezzo"
    t.text     "description"
    t.boolean  "status"
    t.integer  "market_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["market_id"], name: "index_articles_on_market_id"
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_assignments_on_role_id"
    t.index ["user_id"], name: "index_assignments_on_user_id"
  end

  create_table "followmarkets", force: :cascade do |t|
    t.integer  "buyer_id"
    t.integer  "market_followed_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["buyer_id", "market_followed_id"], name: "index_followmarkets_on_buyer_id_and_market_followed_id", unique: true
    t.index ["buyer_id"], name: "index_followmarkets_on_buyer_id"
    t.index ["market_followed_id"], name: "index_followmarkets_on_market_followed_id"
  end

  create_table "markets", force: :cascade do |t|
    t.string   "name"
    t.integer  "tipo"
    t.string   "nation"
    t.string   "city"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_markets_on_user_id"
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
