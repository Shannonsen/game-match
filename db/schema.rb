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

ActiveRecord::Schema.define(version: 2024_11_19_191452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "videogame_categories", force: :cascade do |t|
    t.bigint "videogame_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_videogame_categories_on_category_id"
    t.index ["videogame_id"], name: "index_videogame_categories_on_videogame_id"
  end

  create_table "videogame_genres", force: :cascade do |t|
    t.bigint "videogame_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_videogame_genres_on_genre_id"
    t.index ["videogame_id"], name: "index_videogame_genres_on_videogame_id"
  end

  create_table "videogames", force: :cascade do |t|
    t.string "name", null: false
    t.string "publisher"
    t.string "description", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.date "release_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "videogame_categories", "categories"
  add_foreign_key "videogame_categories", "videogames"
  add_foreign_key "videogame_genres", "genres"
  add_foreign_key "videogame_genres", "videogames"
end
