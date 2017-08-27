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

ActiveRecord::Schema.define(version: 20170827141135) do

  create_table "branches", force: :cascade do |t|
    t.string   "branch_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "departaments", force: :cascade do |t|
    t.string   "departament_name"
    t.string   "departament_description"
    t.string   "departamentlogotype"
    t.string   "subordinated"
    t.integer  "branch_id"
    t.integer  "organization_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["organization_id"], name: "index_departaments_on_organization_id"
  end

  create_table "infos", force: :cascade do |t|
    t.string   "header"
    t.string   "text"
    t.string   "myPhoto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lines", force: :cascade do |t|
    t.string   "rec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "subordinated"
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
    t.string   "public_presentation_user_id"
    t.integer  "branch_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.string   "surename"
    t.string   "patronimic"
    t.string   "subordinated"
    t.string   "post"
    t.string   "email",                  default: "", null: false
    t.string   "secondary_email"
    t.string   "encrypted_password",     default: "", null: false
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
    t.integer  "branch_id"
    t.integer  "organization_id"
    t.integer  "departament_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.index ["departament_id"], name: "index_units_on_departament_id"
    t.index ["email"], name: "index_units_on_email", unique: true
    t.index ["organization_id"], name: "index_units_on_organization_id"
    t.index ["reset_password_token"], name: "index_units_on_reset_password_token", unique: true
  end

end
