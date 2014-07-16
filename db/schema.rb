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

ActiveRecord::Schema.define(version: 20140714234126) do

  create_table "actions", force: true do |t|
    t.string   "name"
    t.datetime "date"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "issue_id"
  end

  create_table "issues", force: true do |t|
    t.string   "customer_name"
    t.string   "issue_title"
    t.string   "received_by"
    t.string   "assigned_to"
    t.datetime "assigned_date", default: '2014-07-14 22:35:55'
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
  end

end
