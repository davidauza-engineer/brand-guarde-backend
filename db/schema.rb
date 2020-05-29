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

ActiveRecord::Schema.define(version: 2020_05_29_143026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chains", force: :cascade do |t|
    t.string "name", limit: 255, default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_chains_on_name", unique: true
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_countries_on_name", unique: true
  end

  create_table "restaurants", force: :cascade do |t|
    t.bigint "chain_id", null: false
    t.bigint "country_id", null: false
    t.string "name", limit: 255, default: "", null: false
    t.string "address", limit: 255, default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address"], name: "index_restaurants_on_address"
    t.index ["chain_id"], name: "index_restaurants_on_chain_id"
    t.index ["country_id"], name: "index_restaurants_on_country_id"
    t.index ["name"], name: "index_restaurants_on_name", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "restaurant_id", null: false
    t.text "body", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", limit: 255, default: "", null: false
    t.string "email", limit: 255, default: "", null: false
    t.string "password_digest", limit: 255, default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "restaurants", "chains"
  add_foreign_key "restaurants", "countries"
  add_foreign_key "reviews", "restaurants"
  add_foreign_key "reviews", "users"
end
