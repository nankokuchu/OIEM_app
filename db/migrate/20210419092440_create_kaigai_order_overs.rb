class CreateKaigaiOrderOvers < ActiveRecord::Migration[6.0]
  def change
    create_table :kaigai_order_overs do |t|
      t.references :kaigai_order, foreign_key: true
      t.timestamps
    end
  end
end
