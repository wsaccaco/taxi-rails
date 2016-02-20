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

ActiveRecord::Schema.define(version: 20160219232507) do

  create_table "drivers", force: :cascade do |t|
    t.string   "driv_plate"
    t.string   "driv_trademark"
    t.string   "driv_colour"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
  end

  add_index "drivers", ["user_id"], name: "index_drivers_on_user_id"

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "born_at"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "celular"
    t.string   "type"
    t.string   "profie_type"
    t.string   "profile_type"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "search_taxis", force: :cascade do |t|
    t.datetime "search_datetime"
    t.string   "search_geo_start"
    t.string   "search_geo_end"
    t.text     "search_referencia"
    t.string   "search_status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
  end

  add_index "search_taxis", ["user_id"], name: "index_search_taxis_on_user_id"

  create_table "services", force: :cascade do |t|
    t.datetime "serv_datetime_start"
    t.string   "serv_waypoint"
    t.float    "serv_precio"
    t.datetime "serv_time"
    t.string   "serv_status"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "driver_id"
    t.integer  "search_taxi_id"
  end

  add_index "services", ["driver_id"], name: "index_services_on_driver_id"
  add_index "services", ["search_taxi_id"], name: "index_services_on_search_taxi_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.string   "user_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
