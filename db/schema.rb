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

ActiveRecord::Schema.define(version: 20170926223357) do

  create_table "articles", force: :cascade do |t|
    t.string   "name"
    t.integer  "prezzo"
    t.text     "description"
    t.boolean  "status"
    t.integer  "market_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "picture"
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

  create_table "mailboxer_conversation_opt_outs", force: :cascade do |t|
    t.string  "unsubscriber_type"
    t.integer "unsubscriber_id"
    t.integer "conversation_id"
    t.index ["conversation_id"], name: "index_mailboxer_conversation_opt_outs_on_conversation_id"
    t.index ["unsubscriber_id", "unsubscriber_type"], name: "index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type"
  end

  create_table "mailboxer_conversations", force: :cascade do |t|
    t.string   "subject",    default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "mailboxer_notifications", force: :cascade do |t|
    t.string   "type"
    t.text     "body"
    t.string   "subject",              default: ""
    t.string   "sender_type"
    t.integer  "sender_id"
    t.integer  "conversation_id"
    t.boolean  "draft",                default: false
    t.string   "notification_code"
    t.string   "notified_object_type"
    t.integer  "notified_object_id"
    t.string   "attachment"
    t.datetime "updated_at",                           null: false
    t.datetime "created_at",                           null: false
    t.boolean  "global",               default: false
    t.datetime "expires"
    t.index ["conversation_id"], name: "index_mailboxer_notifications_on_conversation_id"
    t.index ["notified_object_id", "notified_object_type"], name: "index_mailboxer_notifications_on_notified_object_id_and_type"
    t.index ["notified_object_type", "notified_object_id"], name: "mailboxer_notifications_notified_object"
    t.index ["sender_id", "sender_type"], name: "index_mailboxer_notifications_on_sender_id_and_sender_type"
    t.index ["type"], name: "index_mailboxer_notifications_on_type"
  end

  create_table "mailboxer_receipts", force: :cascade do |t|
    t.string   "receiver_type"
    t.integer  "receiver_id"
    t.integer  "notification_id",                            null: false
    t.boolean  "is_read",                    default: false
    t.boolean  "trashed",                    default: false
    t.boolean  "deleted",                    default: false
    t.string   "mailbox_type",    limit: 25
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "is_delivered",               default: false
    t.string   "delivery_method"
    t.string   "message_id"
    t.index ["notification_id"], name: "index_mailboxer_receipts_on_notification_id"
    t.index ["receiver_id", "receiver_type"], name: "index_mailboxer_receipts_on_receiver_id_and_receiver_type"
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

  create_table "reviews", force: :cascade do |t|
    t.text     "content"
    t.integer  "article_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_reviews_on_article_id"
    t.index ["user_id", "created_at"], name: "index_reviews_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_cart_items", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "quantity"
    t.integer  "item_id"
    t.string   "item_type"
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.integer  "prezzo"
    t.string   "nome"
    t.boolean  "aviable"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_list_items", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "quantity"
    t.integer  "item_id"
    t.string   "item_type"
    t.integer  "price_cents",    default: 0,     null: false
    t.string   "price_currency", default: "USD", null: false
    t.integer  "prezzo"
    t.string   "nome"
    t.boolean  "aviable"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "role"
    t.integer  "budget",           default: 150, null: false
    t.text     "description"
    t.integer  "shopping_cart_id"
    t.integer  "shopping_list_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["shopping_cart_id"], name: "index_users_on_shopping_cart_id"
    t.index ["shopping_list_id"], name: "index_users_on_shopping_list_id"
  end

end
