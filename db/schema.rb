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

ActiveRecord::Schema[7.0].define(version: 2022_11_28_161548) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "donation_description"
    t.string "section"
    t.bigint "location_id", null: false
    t.string "collection_notes"
    t.bigint "value_id", null: false
    t.string "status"
    t.datetime "expiry", precision: nil
    t.bigint "reactions_id", null: false
    t.boolean "is_owner"
    t.bigint "photos_id", null: false
    t.bigint "user_id", null: false
    t.datetime "last_listed", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_articles_on_location_id"
    t.index ["photos_id"], name: "index_articles_on_photos_id"
    t.index ["reactions_id"], name: "index_articles_on_reactions_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
    t.index ["value_id"], name: "index_articles_on_value_id"
  end

  create_table "avatars", force: :cascade do |t|
    t.string "original_url"
    t.string "large_url"
    t.string "small_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.float "distance"
    t.string "town"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "uid"
    t.string "original_url"
    t.string "large_url"
    t.string "medium_url"
    t.string "small_url"
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reactions", force: :cascade do |t|
    t.integer "likes"
    t.boolean "by_user"
    t.integer "views"
    t.integer "impressions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.bigint "avatar_id", null: false
    t.float "location_latitude"
    t.float "location_longitude"
    t.integer "rating"
    t.integer "rating_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avatar_id"], name: "index_users_on_avatar_id"
  end

  create_table "users_verifications", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "verification_id", null: false
  end

  create_table "values", force: :cascade do |t|
    t.float "price"
    t.string "currency"
    t.string "payment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "verifications", force: :cascade do |t|
    t.string "method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "articles", "\"values\"", column: "value_id"
  add_foreign_key "articles", "locations"
  add_foreign_key "articles", "photos", column: "photos_id"
  add_foreign_key "articles", "reactions", column: "reactions_id"
  add_foreign_key "articles", "users"
  add_foreign_key "users", "avatars"
end
