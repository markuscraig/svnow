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

ActiveRecord::Schema.define(version: 20131011035451) do

  create_table "app_themes", force: true do |t|
    t.string   "primary_color",      null: false
    t.string   "secondary_color",    null: false
    t.string   "welcome_splash_url", null: false
    t.string   "video_splash_url",   null: false
    t.string   "welcome_text",       null: false
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "apps", force: true do |t|
    t.string   "name",       null: false
    t.string   "developer",  null: false
    t.string   "app_key",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_segments", force: true do |t|
    t.string   "name",       null: false
    t.datetime "start_time", null: false
    t.datetime "end_time",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  create_table "events", force: true do |t|
    t.string   "name",       null: false
    t.datetime "start_time", null: false
    t.datetime "end_time",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id"
  end

  create_table "team_apps", force: true do |t|
    t.integer  "team_id"
    t.integer  "app_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_venues", force: true do |t|
    t.integer  "team_id"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "venue_apps", force: true do |t|
    t.integer  "app_id",     null: false
    t.integer  "venue_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: true do |t|
    t.string   "name",                null: false
    t.string   "address",             null: false
    t.string   "city",                null: false
    t.string   "state",               null: false
    t.decimal  "latitude",            null: false
    t.decimal  "longitude",           null: false
    t.integer  "immediate_radius_ft", null: false
    t.integer  "near_radius_miles",   null: false
    t.integer  "far_radius_miles",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
