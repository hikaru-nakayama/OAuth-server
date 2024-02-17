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

ActiveRecord::Schema[7.0].define(version: 2024_02_17_184214) do
  create_table "access_tokens", charset: "utf8mb4", force: :cascade do |t|
    t.string "value", null: false
    t.integer "user_id", null: false
    t.string "client_id", null: false
    t.datetime "expierd_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "access_tokens_scopes", charset: "utf8mb4", force: :cascade do |t|
    t.integer "access_token_id", null: false
    t.integer "scope_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authorization_code_scopes", charset: "utf8mb4", force: :cascade do |t|
    t.integer "authorization_code_id", null: false
    t.integer "scope_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authorization_codes", charset: "utf8mb4", force: :cascade do |t|
    t.string "value", null: false
    t.integer "user_id", null: false
    t.string "client_id", null: false
    t.string "redirect_uri"
    t.datetime "expierd_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "secret"
    t.string "uid"
    t.string "redirect_uri"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scopes", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "login_id", null: false
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login_id"], name: "index_users_on_login_id", unique: true
  end

end
