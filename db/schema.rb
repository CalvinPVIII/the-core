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

ActiveRecord::Schema.define(version: 2020_01_22_190056) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "weapon_id"
    t.string "img"
  end

  create_table "mobs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "power"
    t.integer "health"
    t.integer "level_id"
    t.string "img"
  end

  create_table "players", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "power"
    t.integer "health"
    t.integer "weapon_id"
    t.integer "level_id"
    t.boolean "n_stat"
    t.boolean "s_stat"
    t.boolean "e_stat"
    t.boolean "w_stat"
    t.string "img"
    t.string "email"
    t.string "password_hash"
    t.string "password_salt"
  end

  create_table "weapons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "damage"
    t.integer "multiplyer"
    t.string "debuff_effect"
    t.string "img"
    t.integer "player_id"
  end

end
