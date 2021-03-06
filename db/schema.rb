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

ActiveRecord::Schema.define(version: 20170902213954) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.string   "branch_name_en"
    t.string   "branch_name_ru"
    t.string   "branch_name_uk"
    t.string   "subordinated"
    t.integer  "subordinated_id"
    t.boolean  "hidden",          default: false
    t.boolean  "blocked",         default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "departaments", force: :cascade do |t|
    t.string   "departament_name"
    t.string   "departament_description"
    t.string   "departamentlogotype"
    t.string   "subordinated"
    t.integer  "subordinated_id"
    t.boolean  "hidden",                  default: false
    t.boolean  "blocked",                 default: false
    t.integer  "public_unit_id"
    t.integer  "branch_id"
    t.integer  "organization_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["organization_id"], name: "index_departaments_on_organization_id", using: :btree
  end

  create_table "infos", force: :cascade do |t|
    t.string   "great_header_en"
    t.string   "great_header_ru"
    t.string   "great_header_uk"
    t.string   "header_en"
    t.string   "text_en"
    t.string   "header_ru"
    t.string   "text_ru"
    t.string   "header_uk"
    t.string   "text_uk"
    t.string   "myPhoto"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "lines", force: :cascade do |t|
    t.string   "rec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "subordinated"
    t.integer  "subordinated_id"
    t.string   "country"
    t.string   "state"
    t.string   "region"
    t.string   "town"
    t.string   "street"
    t.string   "build"
    t.string   "block"
    t.string   "office"
    t.string   "web_page"
    t.string   "our_skils"
    t.string   "organizationlogotype"
    t.integer  "public_unit_id"
    t.boolean  "hidden",               default: false
    t.boolean  "blocked",              default: false
    t.integer  "branch_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "searches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.string   "surename"
    t.string   "patronymic"
    t.string   "subordinated"
    t.integer  "subordinated_id"
    t.string   "post"
    t.string   "email",                   default: "",    null: false
    t.string   "secondary_email"
    t.string   "encrypted_password",      default: "",    null: false
    t.string   "primary_phone_number"
    t.string   "secondary_phone_number"
    t.string   "short_phone_nunber"
    t.string   "fax"
    t.string   "home_phone_number"
    t.string   "web_page"
    t.string   "start_work"
    t.string   "finish_work"
    t.string   "working_days"
    t.date     "birthday"
    t.string   "unitphoto"
    t.string   "characteristic"
    t.string   "role"
    t.string   "locale",                  default: "uk"
    t.boolean  "hidden",                  default: false
    t.boolean  "blocked",                 default: false
    t.boolean  "public_for_organization", default: false
    t.boolean  "public_for_departament",  default: false
    t.integer  "branch_id"
    t.integer  "organization_id"
    t.integer  "departament_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["departament_id"], name: "index_units_on_departament_id", using: :btree
    t.index ["email"], name: "index_units_on_email", unique: true, using: :btree
    t.index ["organization_id"], name: "index_units_on_organization_id", using: :btree
    t.index ["reset_password_token"], name: "index_units_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "departaments", "organizations"
  add_foreign_key "units", "departaments"
  add_foreign_key "units", "organizations"
end
