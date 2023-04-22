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

ActiveRecord::Schema[7.0].define(version: 2023_04_22_175024) do
  create_table "certification", primary_key: "certificationID", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "UID", limit: 45, null: false
    t.string "title", null: false
    t.string "type", limit: 45, null: false
    t.date "issue_date"
    t.string "skills"
    t.index ["UID"], name: "certificationUID"
  end

  create_table "certifications", primary_key: "certificationID", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "UID"
    t.string "title"
    t.string "type"
    t.date "issue_date"
    t.text "skills"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ibmcsv", id: false, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "uid"
    t.text "org"
    t.text "work_location"
    t.text "certification"
    t.text "issue_date"
    t.text "type"
  end

  create_table "user", primary_key: "UID", id: { type: :string, limit: 45 }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", limit: 45
    t.string "password", limit: 45
    t.string "org", limit: 45, null: false
    t.string "work_location", limit: 45, null: false
  end

  create_table "user_certifications", primary_key: ["UID", "certificationID"], charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "UID", null: false
    t.integer "certificationID", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usercertification", primary_key: ["UID", "certificationID"], charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "UID", limit: 45, null: false
    t.integer "certificationID", null: false
    t.index ["certificationID"], name: "certificationID"
  end

  create_table "users", primary_key: "UID", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "org"
    t.string "work_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "certification", "usercertification", column: "UID", primary_key: "UID", name: "certificationUID"
  add_foreign_key "usercertification", "certification", column: "certificationID", primary_key: "certificationID", name: "certificationID"
  add_foreign_key "usercertification", "user", column: "UID", primary_key: "UID", name: "UID"
end
