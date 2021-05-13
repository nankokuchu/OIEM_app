class CreateExchangeRateSets < ActiveRecord::Migration[6.0]
  def change
    create_table :exchange_rate_sets do |t|
      t.integer :exchange_country_id, null: false
      t.string :rate, null: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
