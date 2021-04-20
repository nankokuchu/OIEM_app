class CreateKaigaiTrackings < ActiveRecord::Migration[6.0]
  def change
    create_table :kaigai_trackings do |t|
      t.string :number, null: false
      t.references :kaigai_order, foreign_key: true
      t.timestamps
    end
  end
end
