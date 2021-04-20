class CreateKaigaiOrderPays < ActiveRecord::Migration[6.0]
  def change
    create_table :kaigai_order_pays do |t|
      t.references :user, foreign_key: true
      t.references :kaigai_order, foreign_key: true
      t.timestamps
    end
  end
end
