class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :jp_name, null: false
      t.string :eng_name, null: false
      t.string :jp_material, null: false
      t.string :eng_material, null: false
      t.string :manufacture_name, null: false
      t.string :item_selection, null: false
      t.string :manufacture_item_selection, null: false
      t.string :manufacture_url, null: false
      t.integer :selling_price, null: false
      t.integer :purchase_price, null: false
      t.string :weight, null: false
      t.string :stock_standard, null: false
      t.integer :items_status_id, null: false
      t.integer :order_status_id, null: false
      t.string :stock_quantity, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
