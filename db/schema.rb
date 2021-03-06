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

ActiveRecord::Schema.define(version: 2021_05_06_201240) do

  create_table "media_assets", force: :cascade do |t|
    t.string "title"
    t.string "media_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.integer "media_asset_id"
    t.integer "rating"
    t.integer "recommendation_maker_id"
    t.integer "recommendation_receiver_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recommendation_maker_id"], name: "index_recommendations_on_recommendation_maker_id"
    t.index ["recommendation_receiver_id"], name: "index_recommendations_on_recommendation_receiver_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
    t.string "provider"
  end

  add_foreign_key "recommendations", "users", column: "recommendation_maker_id"
  add_foreign_key "recommendations", "users", column: "recommendation_receiver_id"
end
