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

ActiveRecord::Schema[7.0].define(version: 2024_05_30_164003) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "champs", force: :cascade do |t|
    t.string "name"
    t.integer "champid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority"
    t.integer "meta_id"
    t.integer "user_id"
    t.integer "temp_id"
  end

  create_table "checkworks", force: :cascade do |t|
    t.boolean "temping"
    t.boolean "metaing"
    t.string "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "easycounters", force: :cascade do |t|
    t.integer "meta_id"
    t.integer "user_id"
    t.integer "x"
    t.integer "y"
    t.string "name1"
    t.string "name2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "easykihons", force: :cascade do |t|
    t.integer "meta_id"
    t.integer "user_id"
    t.integer "x"
    t.integer "y"
    t.string "name1"
    t.string "name2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "easyscores", force: :cascade do |t|
    t.string "name"
    t.string "name2"
    t.integer "point"
    t.integer "SC"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "easysituations", force: :cascade do |t|
    t.string "situationname"
    t.integer "meta_id"
    t.integer "user_id"
    t.integer "x"
    t.integer "y"
    t.string "name1"
    t.string "name2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "easysynergies", force: :cascade do |t|
    t.integer "meta_id"
    t.integer "user_id"
    t.integer "x"
    t.integer "y"
    t.string "name1"
    t.string "name2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_sessions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.integer "proprity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "joukyous", force: :cascade do |t|
    t.string "name"
    t.integer "temp_id"
    t.integer "user_id"
    t.integer "meta_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maps", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meta", force: :cascade do |t|
    t.integer "IDmeta"
    t.string "name"
    t.integer "IDGame"
    t.string "setumei"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metamons", force: :cascade do |t|
    t.string "name"
    t.string "setumei"
    t.string "gamename"
    t.integer "metaid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "temp_id"
    t.integer "metamonid"
    t.integer "tempuser_id"
    t.integer "truemetamonid"
  end

  create_table "score_maps", force: :cascade do |t|
    t.string "me"
    t.integer "situation_id"
    t.string "situationname"
    t.integer "temp_id"
    t.integer "metamon_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "point"
  end

  create_table "scores", force: :cascade do |t|
    t.string "me"
    t.string "enemy"
    t.integer "point"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "temp_id"
    t.integer "metamon_id"
    t.integer "SC"
    t.integer "csgo"
  end

  create_table "situations", force: :cascade do |t|
    t.string "situname"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temps", force: :cascade do |t|
    t.string "name"
    t.integer "usertemp_id"
    t.integer "temp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_temps_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "tempting"
    t.boolean "metating"
    t.integer "doingtempid"
    t.integer "doingtempuserid"
    t.integer "ifnewtemp"
    t.integer "ifnewmeta"
    t.integer "editingtempid"
    t.integer "editingmetaid"
    t.boolean "editting"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "temps", "users"
end
