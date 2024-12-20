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

ActiveRecord::Schema[7.2].define(version: 2024_12_13_041613) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chords", force: :cascade do |t|
    t.string "name"
    t.string "chord_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "string_set"
    t.index ["name", "string_set"], name: "index_chords_on_name_and_string_set", unique: true
  end

  create_table "inversions", force: :cascade do |t|
    t.string "name"
    t.integer "finger_positions", default: [], array: true
    t.string "intervals"
    t.bigint "chord_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chord_id"], name: "index_inversions_on_chord_id"
  end

  add_foreign_key "inversions", "chords"
end
