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

ActiveRecord::Schema.define(version: 20140707181324) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins_branch_groups", id: false, force: true do |t|
    t.integer "user_id",         null: false
    t.integer "branch_group_id", null: false
  end

  add_index "admins_branch_groups", ["branch_group_id"], name: "index_admins_branch_groups_on_branch_group_id", using: :btree
  add_index "admins_branch_groups", ["user_id"], name: "index_admins_branch_groups_on_user_id", using: :btree

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
    t.string   "full_name"
    t.string   "phone_number"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
