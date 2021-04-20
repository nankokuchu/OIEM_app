class CreateKaigaiOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :kaigai_orders do |t|
      t.string :kaigai_order_name, null: false
      t.string :kaigai_order_weight, null: false
      t.integer :kaigai_order_price, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
