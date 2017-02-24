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

ActiveRecord::Schema.define(version: 20170220062535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_counter_offers", force: :cascade do |t|
    t.integer  "business_id"
    t.integer  "charity_offer_id"
    t.string   "shortCode",        limit: 6
    t.string   "shortDescription"
    t.string   "longDescription"
    t.decimal  "amount",                     precision: 8, scale: 2
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "business_counter_offers", ["business_id"], name: "index_business_counter_offers_on_business_id", using: :btree
  add_index "business_counter_offers", ["charity_offer_id"], name: "index_business_counter_offers_on_charity_offer_id", using: :btree

  create_table "businesses", force: :cascade do |t|
    t.string   "name"
    t.string   "shortCode",        limit: 6
    t.string   "shortDescription"
    t.string   "longDescription"
    t.string   "contactEmail"
    t.string   "contactPhone"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "charities", force: :cascade do |t|
    t.string   "name"
    t.string   "shortCode",        limit: 6
    t.string   "shortDescription"
    t.string   "longDescription"
    t.string   "contactEmail"
    t.string   "contactPhone"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "charity_offers", force: :cascade do |t|
    t.integer  "charity_id"
    t.string   "shortCode",        limit: 6
    t.string   "shortDescription"
    t.string   "longDescription"
    t.decimal  "amount",                     precision: 8, scale: 2
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "charity_offers", ["charity_id"], name: "index_charity_offers_on_charity_id", using: :btree

  create_table "commitments", force: :cascade do |t|
    t.integer  "individual_id"
    t.integer  "charity_offer_id"
    t.integer  "business_counter_offer_id"
    t.datetime "expectedDate"
    t.boolean  "fulfilled"
    t.datetime "fulfilledDate"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "commitments", ["business_counter_offer_id"], name: "index_commitments_on_business_counter_offer_id", using: :btree
  add_index "commitments", ["charity_offer_id"], name: "index_commitments_on_charity_offer_id", using: :btree
  add_index "commitments", ["individual_id"], name: "index_commitments_on_individual_id", using: :btree

  create_table "individuals", force: :cascade do |t|
    t.string   "source",     limit: 3
    t.string   "sourceID"
    t.string   "firstName"
    t.string   "lastName"
    t.string   "email"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_foreign_key "business_counter_offers", "businesses"
  add_foreign_key "business_counter_offers", "charity_offers"
  add_foreign_key "charity_offers", "charities"
  add_foreign_key "commitments", "business_counter_offers"
  add_foreign_key "commitments", "charity_offers"
  add_foreign_key "commitments", "individuals"
end
