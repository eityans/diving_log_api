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

ActiveRecord::Schema[8.0].define(version: 2025_06_22_133537) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "dive_logs", force: :cascade do |t|
    t.integer "dive_number", null: false
    t.string "spot_name", null: false
    t.date "date", null: false
    t.string "entry_time"
    t.string "exit_time"
    t.string "guide_name"
    t.float "max_temp"
    t.float "min_temp"
    t.float "max_depth"
    t.float "average_depth"
    t.float "weight"
    t.text "equipment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.text "memo"
    t.integer "visibility", comment: "Visibility in meters"
    t.integer "air_remaining", comment: "Remaining air pressure in bar"
    t.index ["dive_number", "user_id"], name: "index_dive_logs_on_dive_number_and_user_id", unique: true
    t.index ["user_id"], name: "index_dive_logs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "sub"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub"], name: "index_users_on_sub", unique: true
  end

  add_foreign_key "dive_logs", "users"
end
