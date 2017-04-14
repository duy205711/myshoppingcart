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

ActiveRecord::Schema.define(version: 20170413102648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id", using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "birth_date"
    t.integer  "sex"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "order_number"
    t.integer  "user_id"
    t.string   "name"
    t.float    "total_prices"
    t.integer  "total_products"
    t.string   "email"
    t.text     "address"
    t.integer  "address_type"
    t.string   "phone"
    t.text     "info"
    t.integer  "payment_type"
    t.integer  "delivery_type"
    t.float    "delivery_fee"
    t.boolean  "receipt_required"
    t.datetime "delivery_time_min"
    t.datetime "delivery_time_max"
    t.integer  "status"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["email"], name: "index_orders_on_email", using: :btree
    t.index ["order_number"], name: "index_orders_on_order_number", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "orders_products", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_orders_products_on_order_id", using: :btree
    t.index ["product_id"], name: "index_orders_products_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "picture"
    t.string   "author"
    t.string   "publisher"
    t.boolean  "package",        default: false
    t.decimal  "discount_price"
    t.boolean  "available",      default: false
    t.decimal  "quantity"
  end

  create_table "products_categories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_products_categories_on_category_id", using: :btree
    t.index ["product_id"], name: "index_products_categories_on_product_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  add_foreign_key "orders_products", "orders"
  add_foreign_key "orders_products", "products"
end
