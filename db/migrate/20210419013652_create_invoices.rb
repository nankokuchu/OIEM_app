class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.string :invoice_name, null: false
      t.references :user, foreign_key: true
      t.references :kaigai_order, foreign_key: true
      t.timestamps
    end
  end
end
