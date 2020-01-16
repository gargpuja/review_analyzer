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

ActiveRecord::Schema.define(version: 2020_01_16_063703) do

  create_table "businesses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
  end

  create_table "locations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "location_name"
    t.float "rating"
    t.bigint "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "review_count"
    t.string "place_id"
    t.string "address"
    t.index ["business_id"], name: "index_locations_on_business_id"
  end

  create_table "reports", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.bigint "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_reports_on_business_id"
  end

  create_table "reviewshakejobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "job_id"
    t.boolean "status"
    t.string "state_status"
    t.bigint "locations_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locations_id"], name: "index_reviewshakejobs_on_locations_id"
  end

  add_foreign_key "locations", "businesses"
  add_foreign_key "reports", "businesses"
  add_foreign_key "reviewshakejobs", "locations", column: "locations_id"
end
