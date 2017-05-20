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

ActiveRecord::Schema.define(version: 20170508212418) do

  create_table "departaments", force: :cascade do |t|
    t.string   "departament_name"
    t.string   "departament_description"
    t.integer  "organization_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "departamentlogotype"
    t.index ["organization_id"], name: "index_departaments_on_organization_id"
  end

  create_table "lines", force: :cascade do |t|
    t.string   "rec"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.string   "our_skils"
    t.string   "image"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "organizationlogotype"
  end

  create_table "units", force: :cascade do |t|
    t.string   "full_name"
    t.string   "belong_to_departament"
    t.string   "post"
    t.string   "primary_email"
    t.string   "secondary_email"
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
    t.string   "login"
    t.string   "password"
    t.string   "unitphoto"
    t.string   "characteristic"
    t.integer  "departament_id"
    t.integer  "organization_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["departament_id"], name: "index_units_on_departament_id"
    t.index ["organization_id"], name: "index_units_on_organization_id"
  end

end
