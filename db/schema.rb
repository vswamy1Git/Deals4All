# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 0) do

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id"

  create_table "deals", force: :cascade do |t|
    t.string   "user"
<<<<<<< HEAD
    t.string   "product"
    t.datetime "date"
=======
    t.string   "items"
    t.datetime "date",null: false
>>>>>>> e397c84254e79471a8c5e3f1d0c5c2370082b339
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "rating"
    t.text     "description"
    t.datetime "release_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string   "user"
    t.string   "product"
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "products_id"
  end

  add_index "offers", ["products_id"], name: "index_offers_on_products_id"

<<<<<<< HEAD
  create_table "products", force: :cascade do |t|
    t.string   "productcode"
    t.string   "title"
    t.string   "originalprice"
    t.string   "offer"
    t.string   "status"
    t.datetime "create_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

=======
>>>>>>> e397c84254e79471a8c5e3f1d0c5c2370082b339
  create_table "profiles", force: :cascade do |t|
    t.string   "primary_language"
    t.string   "secondary_language"
    t.string   "favorite_movie"
    t.string   "worst_movie"
    t.string   "favorite_genre"
    t.integer  "user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
