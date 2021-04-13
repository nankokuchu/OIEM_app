class CreateTrackingNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :tracking_numbers do |t|
      t.string :number, null: false
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
