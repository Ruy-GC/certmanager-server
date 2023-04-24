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

ActiveRecord::Schema[7.0].define(version: 2023_04_24_010024) do
  create_table "certifications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "type"
    t.text "skills"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employee_certifications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "employee_id", null: false
    t.bigint "certification_id", null: false
    t.date "issued_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certification_id"], name: "index_employee_certifications_on_certification_id"
    t.index ["employee_id"], name: "index_employee_certifications_on_employee_id"
  end

  create_table "employees", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "org"
    t.string "work_location"
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

  create_table "users", primary_key: "email", id: :string, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "employee_certifications", "certifications"
  add_foreign_key "employee_certifications", "employees"
end
