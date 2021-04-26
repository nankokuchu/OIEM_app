class CreateOrderInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :order_invoices do |t|
      t.string :order_invoice_item_name, null: true
      t.integer :order_invoice_item_price, null: true
      t.string :order_invoice_item_material, null: true
      t.integer :order_invoice_item_quantity, null: true
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
