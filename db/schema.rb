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

ActiveRecord::Schema.define(version: 20181209151824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string "region"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region", "country"], name: "index_locations_on_region_and_country"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "order_number"
    t.string "order_priority"
    t.string "sales_channel"
    t.integer "units_sold"
    t.date "order_date"
    t.date "ship_date"
    t.bigint "location_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_orders_on_location_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "item_type"
    t.float "unit_cost"
    t.float "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.float "total_revenue"
    t.float "total_cost"
    t.float "total_profit"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_reports_on_order_id"
  end

  add_foreign_key "orders", "locations"
  add_foreign_key "orders", "products"
  add_foreign_key "reports", "orders"
end
