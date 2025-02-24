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

ActiveRecord::Schema[8.0].define(version: 2025_02_23_143504) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "form_fields", force: :cascade do |t|
    t.bigint "form_id", null: false
    t.integer "field_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_form_fields_on_form_id"
  end

  create_table "form_notify_emails", force: :cascade do |t|
    t.bigint "verified_emails_id", null: false
    t.bigint "forms_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forms_id"], name: "index_form_notify_emails_on_forms_id"
    t.index ["verified_emails_id"], name: "index_form_notify_emails_on_verified_emails_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name", null: false
    t.integer "project_id", null: false
    t.string "auto_reply_to_field"
    t.string "token"
    t.string "dev_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_forms_on_project_id"
  end

  create_table "project_users", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "project_id", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_users_on_project_id"
    t.index ["user_id"], name: "index_project_users_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "domain_name"
    t.boolean "is_pinned"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "user_agent"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "verified", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "verified_emails", force: :cascade do |t|
    t.string "email", null: false
    t.bigint "projects_id", null: false
    t.boolean "verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["projects_id"], name: "index_verified_emails_on_projects_id"
  end

  add_foreign_key "form_fields", "forms"
  add_foreign_key "form_notify_emails", "forms", column: "forms_id"
  add_foreign_key "form_notify_emails", "verified_emails", column: "verified_emails_id"
  add_foreign_key "forms", "projects"
  add_foreign_key "project_users", "projects"
  add_foreign_key "project_users", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "verified_emails", "projects", column: "projects_id"
end
