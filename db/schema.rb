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

ActiveRecord::Schema.define(version: 20160108184011) do

  create_table "soundfiles", force: :cascade do |t|
    t.integer  "sound_id"
    t.string   "file_name"
    t.string   "content_type"
    t.integer  "file_size"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "soundfiles", ["sound_id"], name: "index_soundfiles_on_sound_id"

  create_table "sounds", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sounds", ["user_id"], name: "index_sounds_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "real_name"
    t.text     "bio"
    t.string   "image_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
