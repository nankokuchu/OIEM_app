class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :price, null: false
      t.integer :quantity, null: false
      t.integer :order_number, null: false
      t.integer :invoice_status_id, null: false
      t.integer :arrival_status_id, null: false
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.timestamps
    end
  end
end
