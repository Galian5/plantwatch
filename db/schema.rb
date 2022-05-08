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

ActiveRecord::Schema.define(version: 2022_05_08_191043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_devices_on_user_id"
  end

  create_table "measurements", force: :cascade do |t|
    t.float "air_humidity"
    t.float "soil_moisture"
    t.float "temperature"
    t.float "insolation"
    t.float "water_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plant_id"
    t.index ["plant_id"], name: "index_measurements_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "device_id"
    t.bigint "user_id"
    t.index ["device_id"], name: "index_plants_on_device_id"
    t.index ["user_id"], name: "index_plants_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.boolean "watering"
    t.integer "interval"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plant_id"
    t.index ["plant_id"], name: "index_schedules_on_plant_id"
  end

  create_table "settings", force: :cascade do |t|
    t.integer "single_watering_amount"
    t.float "min_air_humidity"
    t.float "max_air_humidity"
    t.float "min_soil_moisture"
    t.float "max_soil_moisture"
    t.float "min_temperature"
    t.float "max_temperature"
    t.float "max_insolation"
    t.float "min_water_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "plant_id"
    t.index ["plant_id"], name: "index_settings_on_plant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "devices", "users"
  add_foreign_key "measurements", "plants"
  add_foreign_key "plants", "devices"
  add_foreign_key "plants", "users"
  add_foreign_key "schedules", "plants"
  add_foreign_key "settings", "plants"
end
