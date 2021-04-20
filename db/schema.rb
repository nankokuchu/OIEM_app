# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_19_115252) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "postal_code", null: false
    t.integer "prefecture_id", null: false
    t.string "city", null: false
    t.string "house_number", null: false
    t.string "building_name"
    t.string "phone_number", null: false
    t.bigint "kaigai_order_pay_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kaigai_order_pay_id"], name: "index_addresses_on_kaigai_order_pay_id"
  end

  create_table "infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "info_order_tracking_number", null: false
    t.string "info_order_weight", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoices", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "invoice_name", null: false
    t.bigint "user_id"
    t.bigint "kaigai_order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kaigai_order_id"], name: "index_invoices_on_kaigai_order_id"
    t.index ["user_id"], name: "index_invoices_on_user_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "jp_name", null: false
    t.string "eng_name", null: false
    t.string "jp_material", null: false
    t.string "eng_material", null: false
    t.string "manufacture_name", null: false
    t.string "item_selection", null: false
    t.string "manufacture_item_selection", null: false
    t.string "manufacture_url", null: false
    t.integer "selling_price", null: false
    t.integer "purchase_price", null: false
    t.integer "ppurchase_price", null: false
    t.string "weight", null: false
    t.string "stock_standard", null: false
    t.integer "items_status_id", null: false
    t.integer "order_status_id", null: false
    t.string "stock_quantity", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "kaigai_order_cancels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "kaigai_order_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kaigai_order_id"], name: "index_kaigai_order_cancels_on_kaigai_order_id"
    t.index ["user_id"], name: "index_kaigai_order_cancels_on_user_id"
  end

  create_table "kaigai_order_overs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "kaigai_order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kaigai_order_id"], name: "index_kaigai_order_overs_on_kaigai_order_id"
  end

  create_table "kaigai_order_pays", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "kaigai_order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kaigai_order_id"], name: "index_kaigai_order_pays_on_kaigai_order_id"
    t.index ["user_id"], name: "index_kaigai_order_pays_on_user_id"
  end

  create_table "kaigai_orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "kaigai_order_name", null: false
    t.string "kaigai_order_weight", null: false
    t.integer "kaigai_order_price", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_kaigai_orders_on_user_id"
  end

  create_table "kaigai_trackings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "number", null: false
    t.bigint "kaigai_order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kaigai_order_id"], name: "index_kaigai_trackings_on_kaigai_order_id"
  end

  create_table "manages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "order_tracking_number", null: false
    t.string "order_weight", null: false
    t.bigint "order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_manages_on_order_id"
  end

  create_table "order_cancels", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_order_cancels_on_order_id"
  end

  create_table "order_kaigai_orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "kaigai_order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kaigai_order_id"], name: "index_order_kaigai_orders_on_kaigai_order_id"
    t.index ["order_id"], name: "index_order_kaigai_orders_on_order_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "order_name", null: false
    t.integer "item_price", null: false
    t.integer "total_price", null: false
    t.integer "quantity", null: false
    t.integer "order_number", null: false
    t.integer "invoice_status_id", null: false
    t.integer "arrival_status_id", null: false
    t.bigint "user_id"
    t.bigint "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_orders_on_item_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "tracking_numbers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "number", null: false
    t.bigint "order_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_tracking_numbers_on_order_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "nickname", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_reading", null: false
    t.string "last_name_reading", null: false
    t.date "birthday", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "addresses", "kaigai_order_pays"
  add_foreign_key "invoices", "kaigai_orders"
  add_foreign_key "invoices", "users"
  add_foreign_key "items", "users"
  add_foreign_key "kaigai_order_cancels", "kaigai_orders"
  add_foreign_key "kaigai_order_cancels", "users"
  add_foreign_key "kaigai_order_overs", "kaigai_orders"
  add_foreign_key "kaigai_order_pays", "kaigai_orders"
  add_foreign_key "kaigai_order_pays", "users"
  add_foreign_key "kaigai_orders", "users"
  add_foreign_key "kaigai_trackings", "kaigai_orders"
  add_foreign_key "manages", "orders"
  add_foreign_key "order_cancels", "orders"
  add_foreign_key "order_kaigai_orders", "kaigai_orders"
  add_foreign_key "orders", "items"
  add_foreign_key "orders", "users"
  add_foreign_key "tracking_numbers", "orders"
end
