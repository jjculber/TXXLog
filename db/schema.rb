# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_06_012423) do

  create_table "events", force: :cascade do |t|
    t.string "event_name"
    t.string "callsign"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "exchange"
    t.string "location"
    t.string "section"
    t.string "category"
    t.string "category_power"
    t.boolean "wfd_bonus_offgrid"
    t.boolean "wfd_bonus_outdoor"
    t.boolean "wfd_bonus_remote"
    t.boolean "wfd_bonus_satellite"
    t.string "contact_name"
    t.string "contact_address"
    t.string "contact_city"
    t.string "contact_state"
    t.string "contact_postal_code"
    t.string "contact_country"
    t.string "contact_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "log_entries", force: :cascade do |t|
    t.integer "event_id", null: false
    t.datetime "contact_at"
    t.string "callsign"
    t.string "category"
    t.string "section"
    t.integer "station_id"
    t.integer "user_id"
    t.integer "frequency"
    t.string "mode"
    t.boolean "deleted"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_log_entries_on_event_id"
    t.index ["station_id"], name: "index_log_entries_on_station_id"
    t.index ["user_id"], name: "index_log_entries_on_user_id"
  end

  create_table "stations", force: :cascade do |t|
    t.string "uuid"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["uuid"], name: "index_stations_on_uuid", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "log_entries", "events"
  add_foreign_key "log_entries", "stations"
  add_foreign_key "log_entries", "users"
end
