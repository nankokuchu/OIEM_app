class CreateTransportationExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :transportation_expenses do |t|
      t.string :name, null: false
      t.integer :price, null: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
