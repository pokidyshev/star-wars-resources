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

ActiveRecord::Schema.define(version: 20170227133226) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "films", force: :cascade do |t|
    t.string   "director"
    t.integer  "episode_id"
    t.text     "opening_crawl"
    t.string   "producer"
    t.date     "release_date"
    t.string   "title"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "poster_file_name"
    t.string   "poster_content_type"
    t.integer  "poster_file_size"
    t.datetime "poster_updated_at"
  end

  create_table "films_people", id: false, force: :cascade do |t|
    t.integer "film_id",   null: false
    t.integer "person_id", null: false
  end

  create_table "films_planets", id: false, force: :cascade do |t|
    t.integer "film_id",   null: false
    t.integer "planet_id", null: false
  end

  create_table "films_species", id: false, force: :cascade do |t|
    t.integer "film_id",    null: false
    t.integer "species_id", null: false
  end

  create_table "films_starships", id: false, force: :cascade do |t|
    t.integer "film_id",     null: false
    t.integer "starship_id", null: false
  end

  create_table "films_vehicles", id: false, force: :cascade do |t|
    t.integer "film_id",    null: false
    t.integer "vehicle_id", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "birth_year"
    t.string   "eye_color"
    t.string   "gender"
    t.string   "hair_color"
    t.string   "height"
    t.string   "mass"
    t.string   "name"
    t.string   "skin_color"
    t.integer  "planet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["planet_id"], name: "index_people_on_planet_id", using: :btree
  end

  create_table "people_species", id: false, force: :cascade do |t|
    t.integer "person_id",  null: false
    t.integer "species_id", null: false
  end

  create_table "people_starships", id: false, force: :cascade do |t|
    t.integer "person_id",   null: false
    t.integer "starship_id", null: false
  end

  create_table "people_vehicles", id: false, force: :cascade do |t|
    t.integer "person_id",  null: false
    t.integer "vehicle_id", null: false
  end

  create_table "planets", force: :cascade do |t|
    t.string   "climate"
    t.string   "diameter"
    t.string   "gravity"
    t.string   "name"
    t.string   "orbital_period"
    t.string   "population"
    t.string   "rotation_period"
    t.string   "surface_water"
    t.string   "terrain"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "species", force: :cascade do |t|
    t.string   "average_height"
    t.string   "average_lifespan"
    t.string   "classification"
    t.string   "designation"
    t.string   "eye_colors"
    t.string   "hair_colors"
    t.string   "language"
    t.string   "name"
    t.string   "skin_colors"
    t.integer  "planet_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["planet_id"], name: "index_species_on_planet_id", using: :btree
  end

  create_table "starships", force: :cascade do |t|
    t.string   "MGLT"
    t.string   "cargo_capacity"
    t.string   "consumables"
    t.string   "cost_in_credits"
    t.string   "crew"
    t.string   "hyperdrive_rating"
    t.string   "length"
    t.string   "manufacturer"
    t.string   "max_atmosphering_speed"
    t.string   "model"
    t.string   "name"
    t.string   "passengers"
    t.string   "starship_class"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "cargo_capacity"
    t.string   "consumables"
    t.string   "cost_in_credits"
    t.string   "crew"
    t.string   "length"
    t.string   "manufacturer"
    t.string   "max_atmosphering_speed"
    t.string   "model"
    t.string   "name"
    t.string   "passengers"
    t.string   "vehicle_class"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
