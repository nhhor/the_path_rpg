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

ActiveRecord::Schema.define(version: 2020_01_22_184406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.string "character_name"
    t.integer "character_health"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters_items", id: false, force: :cascade do |t|
    t.bigint "character_id"
    t.bigint "item_id"
    t.index ["character_id"], name: "index_characters_items_on_character_id"
    t.index ["item_id"], name: "index_characters_items_on_item_id"
  end

  create_table "encounters", force: :cascade do |t|
    t.bigint "character_id"
    t.bigint "location_id"
    t.bigint "foe_id"
    t.index ["character_id"], name: "index_encounters_on_character_id"
    t.index ["foe_id"], name: "index_encounters_on_foe_id"
    t.index ["location_id"], name: "index_encounters_on_location_id"
  end

  create_table "foes", force: :cascade do |t|
    t.string "foe_name"
    t.integer "foe_health"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.string "item_type"
    t.integer "item_stat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "location_name"
    t.string "location_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "characters", "users"
end
