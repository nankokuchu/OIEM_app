class CreateManages < ActiveRecord::Migration[6.0]
  def change
    create_table :manages do |t|
      t.string :order_tracking_number, null: false
      t.string :order_weight, null: false
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
