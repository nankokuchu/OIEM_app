class CreateInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :infos do |t|
      t.string :info_order_tracking_number, null: false
      t.string :info_order_weight, null: false
      t.timestamps
    end
  end
end
