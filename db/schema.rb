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

ActiveRecord::Schema.define(version: 20160709103756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "artworks", force: :cascade do |t|
    t.string   "name"
    t.string   "dimension"
    t.text     "description"
    t.text     "notes"
    t.boolean  "production"
    t.integer  "quantity"
    t.string   "typology"
    t.string   "technique"
    t.string   "linkIUAV"
    t.date     "infdate"
    t.date     "supdate"
    t.boolean  "dateexact"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "picture"
  end

  create_table "collaborations", force: :cascade do |t|
    t.integer "artwork_id"
    t.integer "artist_id"
    t.text    "typology"
  end

  add_index "collaborations", ["artist_id"], name: "index_collaborations_on_artist_id", using: :btree
  add_index "collaborations", ["artwork_id"], name: "index_collaborations_on_artwork_id", using: :btree

  add_foreign_key "collaborations", "artists", on_delete: :cascade
  add_foreign_key "collaborations", "artworks", on_delete: :cascade
end
