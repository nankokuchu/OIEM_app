class CreateOrderKaigaiOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :order_kaigai_orders do |t|
      t.references :order, foregin_key: true
      t.references :kaigai_order, foreign_key: true
      t.timestamps
    end
  end
end
