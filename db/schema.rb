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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121008234449) do

  create_table "addresses", :force => true do |t|
    t.string   "type"
    t.text     "address_name"
    t.string   "map_coordinates"
    t.integer  "belong_address_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "addresses", ["belong_address_id"], :name => "index_addresses_on_belong_address_id"
  add_index "addresses", ["id", "belong_address_id"], :name => "index_addresses_on_id_and_belong_address_id", :unique => true

  create_table "blacklists", :force => true do |t|
    t.string   "reason"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "blacklists", ["user_id", "created_at"], :name => "index_blacklists_on_user_id_and_created_at"

  create_table "companies", :force => true do |t|
    t.string   "rif"
    t.string   "commercial_name"
    t.string   "fiscal_name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "companies", ["user_id"], :name => "index_companies_on_user_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.integer  "stock"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "reservations", :force => true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "quantity"
    t.float    "total_cost"
    t.date     "expiration_date"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "reservations", ["product_id"], :name => "index_reservations_on_product_id"
  add_index "reservations", ["user_id", "product_id"], :name => "index_reservations_on_user_id_and_product_id", :unique => true
  add_index "reservations", ["user_id"], :name => "index_reservations_on_user_id"

  create_table "users", :force => true do |t|
    t.integer  "id_number"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["id_number"], :name => "index_users_on_id_number", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
