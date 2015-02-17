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

ActiveRecord::Schema.define(version: 20150213104910) do

  create_table "jewelloans", force: :cascade do |t|
    t.integer  "account_number"
    t.string   "customer_name"
    t.text     "customer_address"
    t.float    "amount"
    t.float    "interest_rate"
    t.date     "opened_on"
    t.date     "due_date"
    t.float    "amount_due"
    t.text     "jewel"
    t.integer  "no_of_items"
    t.float    "gross_weight"
    t.float    "net_weight"
    t.float    "appraised_amount"
    t.float    "loan_amount"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "transaction_mode"
    t.string   "transaction_type"
    t.string   "particulars"
    t.string   "comments"
  end

  create_table "jltransactions", force: :cascade do |t|
    t.date     "transaction_date"
    t.float    "transaction_amount"
    t.string   "transaction_mode"
    t.string   "transaction_type"
    t.string   "particulars"
    t.string   "comments"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "jewelloan_id"
  end

end
