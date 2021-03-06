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

ActiveRecord::Schema.define(version: 20161123071307) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "eauths", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "employer_id"
    t.string   "auth_code"
  end

  create_table "employers", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "name"
    t.string   "email"
    t.date     "dob"
    t.text     "location"
    t.string   "ph_no"
    t.boolean  "details_filled", default: false
    t.boolean  "is_verified",    default: false
    t.boolean  "mail_sent",      default: false
  end

end
