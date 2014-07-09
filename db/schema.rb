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

ActiveRecord::Schema.define(version: 20140709170559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "activity"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins_branch_groups", id: false, force: true do |t|
    t.integer "user_id",         null: false
    t.integer "branch_group_id", null: false
  end

  add_index "admins_branch_groups", ["branch_group_id"], name: "index_admins_branch_groups_on_branch_group_id", using: :btree
  add_index "admins_branch_groups", ["user_id"], name: "index_admins_branch_groups_on_user_id", using: :btree

  create_table "branch_delivery_zones", force: true do |t|
    t.integer  "branch_id"
    t.integer  "zone_id"
    t.decimal  "delivery_charge"
    t.string   "delivery_charge_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "branch_groups", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "restaurant_id"
    t.integer  "main_branch_id"
    t.integer  "country_id"
    t.string   "fb_link"
    t.string   "twitter_link"
    t.string   "gplus_link"
    t.string   "instagram_link"
    t.string   "foursquare_link"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "branch_groups_menu_categories", id: false, force: true do |t|
    t.integer "menu_category_id", null: false
    t.integer "branch_group_id",  null: false
  end

  create_table "branches", force: true do |t|
    t.string   "slug"
    t.string   "name"
    t.string   "address"
    t.string   "phone_number"
    t.time     "working_hour_start"
    t.time     "working_hour_end"
    t.float    "lat"
    t.float    "lng"
    t.decimal  "minimum_order_amount", precision: 10, scale: 2
    t.time     "delivery_hour_start"
    t.time     "delivery_hour_end"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "branches_employees", id: false, force: true do |t|
    t.integer "branch_id",   null: false
    t.integer "employee_id", null: false
  end

  add_index "branches_employees", ["branch_id", "employee_id"], name: "index_branches_employees_on_branch_id_and_employee_id", using: :btree
  add_index "branches_employees", ["employee_id", "branch_id"], name: "index_branches_employees_on_employee_id_and_branch_id", using: :btree

  create_table "branches_menu_categories", id: false, force: true do |t|
    t.integer "branch_id",        null: false
    t.integer "menu_category_id", null: false
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.string   "code2"
    t.string   "code3"
    t.string   "continent"
    t.string   "currency"
    t.string   "timezone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuisines", force: true do |t|
    t.string   "slug"
    t.string   "name"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cuisines_restaurants", id: false, force: true do |t|
    t.integer "cuisine_id",    null: false
    t.integer "restaurant_id", null: false
  end

  add_index "cuisines_restaurants", ["cuisine_id", "restaurant_id"], name: "index_cuisines_restaurants_on_cuisine_id_and_restaurant_id", using: :btree
  add_index "cuisines_restaurants", ["restaurant_id", "cuisine_id"], name: "index_cuisines_restaurants_on_restaurant_id_and_cuisine_id", using: :btree

  create_table "geo_zones", force: true do |t|
    t.float    "lat"
    t.float    "lng"
    t.string   "address"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_option_options", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "item_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_options", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "option_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_options_menu_items", id: false, force: true do |t|
    t.integer "menu_item_id",   null: false
    t.integer "item_option_id", null: false
  end

  create_table "menu_categories", force: true do |t|
    t.string   "slug"
    t.string   "name"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menu_categories_menu_items", id: false, force: true do |t|
    t.integer "menu_category_id", null: false
    t.integer "menu_item_id",     null: false
  end

  create_table "menu_items", force: true do |t|
    t.string   "slug"
    t.string   "name"
    t.text     "description"
    t.decimal  "price",              precision: 10, scale: 2
    t.boolean  "active"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "offers", force: true do |t|
    t.integer  "branch_id"
    t.string   "rule_type"
    t.string   "rule_items_ids"
    t.decimal  "rule_price_reached",      precision: 10, scale: 2
    t.decimal  "result_amount",           precision: 10, scale: 2
    t.decimal  "result_percentage"
    t.string   "result_free_items"
    t.integer  "result_free_items_limit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.datetime "expiry_date"
    t.string   "token"
    t.string   "published"
  end

  create_table "order_item_options", force: true do |t|
    t.integer  "order_item_id"
    t.string   "name"
    t.decimal  "unit_price",    precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "order_item_id"
    t.string   "order_item_name"
    t.integer  "quantity"
    t.decimal  "unit_price",      precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "branch_id"
    t.decimal  "delivery_price"
    t.string   "delivery_type"
    t.string   "currency"
    t.integer  "user_id"
    t.string   "phone_number"
    t.string   "delivery_address"
    t.string   "status"
    t.string   "ip_address"
    t.integer  "delivered_by"
    t.datetime "accepted_at"
    t.integer  "accepted_by"
    t.datetime "rejected_at"
    t.integer  "rejected_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
  end

  create_table "payments", force: true do |t|
    t.string   "reference"
    t.string   "currency"
    t.integer  "order_id"
    t.decimal  "amount",     precision: 10, scale: 2
    t.string   "method"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.string   "fb_link"
    t.string   "twitter_link"
    t.string   "gplus_link"
    t.string   "instagram_link"
    t.string   "foursquare_link"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "user_activities", force: true do |t|
    t.integer  "parent_id"
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "role"
    t.string   "username"
    t.string   "phone_number"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "firstname"
    t.string   "lastname"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
