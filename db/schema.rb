# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_19_025145) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "park_facilities", force: :cascade do |t|
    t.bigint "park_id"
    t.bigint "facility_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_park_facilities_on_facility_id"
    t.index ["park_id", "facility_id"], name: "index_park_facilities_on_park_id_and_facility_id", unique: true
    t.index ["park_id"], name: "index_park_facilities_on_park_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.date "established_date"
    t.integer "size"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "search_content"
  end

  create_table "visitors", force: :cascade do |t|
    t.bigint "park_id", null: false
    t.integer "year"
    t.integer "total_visitors"
    t.integer "camping_visitors"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["park_id"], name: "index_visitors_on_park_id"
  end

  create_table "wildlives", force: :cascade do |t|
    t.string "species_name"
    t.string "habitat"
    t.string "population_status"
    t.bigint "park_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["park_id"], name: "index_wildlives_on_park_id"
  end

  add_foreign_key "park_facilities", "facilities"
  add_foreign_key "park_facilities", "parks"
  add_foreign_key "visitors", "parks"
  add_foreign_key "wildlives", "parks"
end
