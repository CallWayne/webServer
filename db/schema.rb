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

ActiveRecord::Schema.define(version: 20160606143021) do

  create_table "messages", force: :cascade do |t|
    t.string   "sender",            limit: 255
    t.text     "content_enc",       limit: 65535
    t.text     "iv",                limit: 65535
    t.text     "key_recipient_enc", limit: 65535
    t.text     "sig_service",       limit: 65535
    t.text     "sig_recipient",     limit: 65535
    t.text     "recipient",         limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",            limit: 255
    t.text     "salt_masterkey",   limit: 65535
    t.text     "pubkey_user",      limit: 65535
    t.text     "privkey_user_enc", limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end
