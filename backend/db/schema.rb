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

ActiveRecord::Schema.define(version: 2020_01_24_202243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "departements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_promotions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "product_id"
    t.uuid "promotion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_promotions_on_product_id"
    t.index ["promotion_id"], name: "index_product_promotions_on_promotion_id"
  end

  create_table "products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.uuid "departement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departement_id"], name: "index_products_on_departement_id"
  end

  create_table "promotions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "code"
    t.boolean "active"
    t.integer "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end


  create_view "offers", sql_definition: <<-SQL
      SELECT d.name AS departement_name,
      prod.name AS product_name,
      prod.price AS product_price,
      prom.code AS promotion_code,
      prom.active AS promotion_active,
      prom.discount AS promotion_discount
     FROM (((products prod
       JOIN departements d ON ((prod.departement_id = d.id)))
       JOIN product_promotions prod_prom ON ((prod_prom.product_id = prod.id)))
       JOIN promotions prom ON ((prod_prom.promotion_id = prom.id)));
  SQL
end
