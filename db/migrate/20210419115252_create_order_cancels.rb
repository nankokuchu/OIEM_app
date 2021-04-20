class CreateOrderCancels < ActiveRecord::Migration[6.0]
  def change
    create_table :order_cancels do |t|
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
