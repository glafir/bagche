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

ActiveRecord::Schema.define(version: 20151021173811) do

  create_table "brands", force: :cascade do |t|
    t.string   "namebrand",  limit: 255
    t.integer  "country_id", limit: 4
    t.string   "logotip",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment",    limit: 255
    t.integer  "user_id",    limit: 4,   null: false
    t.integer  "order_id",   limit: 4
    t.integer  "product_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "country_name",      limit: 255
    t.string   "country_iata_code", limit: 255
    t.string   "country_icao_code", limit: 255
    t.integer  "country_number",    limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "flash_message_states", force: :cascade do |t|
    t.string   "state",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "flash_messages", force: :cascade do |t|
    t.integer  "user_id",                limit: 4,    null: false
    t.string   "message",                limit: 255,  null: false
    t.string   "request_url",            limit: 255,  null: false
    t.string   "request_ip",             limit: 15,   null: false
    t.string   "request_method",         limit: 6,    null: false
    t.string   "request_referrer",       limit: 1000, null: false
    t.string   "useragent",              limit: 1000, null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "flash_message_state_id", limit: 4
  end

  create_table "order_histories", force: :cascade do |t|
    t.integer  "order_id",      limit: 4,              null: false
    t.integer  "user_id",       limit: 4,              null: false
    t.integer  "comment_id",    limit: 4,  default: 0, null: false
    t.string   "history_store", limit: 50
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "order_states", force: :cascade do |t|
    t.string   "state",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id",        limit: 4,             null: false
    t.integer  "manager_id",     limit: 4
    t.integer  "product_id",     limit: 4,             null: false
    t.integer  "order_state_id", limit: 4, default: 1, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "prod_images", force: :cascade do |t|
    t.string   "prodimage",  limit: 255
    t.integer  "product_id", limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "brand_id",      limit: 4,               null: false
    t.string   "name",          limit: 255
    t.string   "amodel",        limit: 255
    t.string   "artcode",       limit: 255
    t.integer  "quantity",      limit: 4
    t.float    "price",         limit: 24
    t.string   "description",   limit: 255
    t.integer  "prod_image_id", limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "publish",       limit: 4,   default: 0, null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name_rus",       limit: 255
    t.string   "name_eng",       limit: 255
    t.integer  "country_id",     limit: 4
    t.float    "area",           limit: 24
    t.integer  "population",     limit: 4
    t.integer  "capitalcity_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", limit: 4
    t.integer "user_id", limit: 4
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255,   null: false
    t.text     "data",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "towns", force: :cascade do |t|
    t.string   "country_iso", limit: 3,   default: "", null: false
    t.integer  "country_id",  limit: 4
    t.string   "city",        limit: 255, default: "", null: false
    t.string   "accent_city", limit: 255, default: "", null: false
    t.string   "city_rus",    limit: 255, default: ""
    t.string   "region",      limit: 3,   default: "", null: false
    t.float    "latitude",    limit: 24
    t.float    "longitude",   limit: 24
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "towns", ["accent_city"], name: "accent_city", using: :btree
  add_index "towns", ["city"], name: "city", using: :btree
  add_index "towns", ["city_rus"], name: "city_rus", using: :btree
  add_index "towns", ["country_id"], name: "country_id", using: :btree
  add_index "towns", ["country_iso"], name: "country", using: :btree

  create_table "user_themes", force: :cascade do |t|
    t.string   "theme",      limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_themes", ["theme"], name: "theme", unique: true, using: :btree

  create_table "user_tracings", force: :cascade do |t|
    t.integer  "user_id",     limit: 4,     null: false
    t.string   "ip_address",  limit: 15
    t.text     "useragent",   limit: 65535
    t.datetime "sign_in_at",                null: false
    t.datetime "sign_out_at",               null: false
  end

  add_index "user_tracings", ["ip_address"], name: "ip_address", using: :btree
  add_index "user_tracings", ["user_id"], name: "index_user_tracings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 255,              null: false
    t.string   "nickname",               limit: 255
    t.string   "provider",               limit: 255
    t.string   "url",                    limit: 255
    t.string   "uid",                    limit: 255
    t.string   "time_zone",              limit: 255,              null: false
    t.integer  "town_id",                limit: 4
    t.integer  "manager_id",             limit: 4,   default: 0,  null: false
    t.integer  "user_theme_id",          limit: 4,   default: 1,  null: false
    t.integer  "role",                   limit: 4,   default: 4,  null: false
    t.datetime "last_seen"
    t.string   "password_salt",          limit: 255
    t.string   "avatar",                 limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
