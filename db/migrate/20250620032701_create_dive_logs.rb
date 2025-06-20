class CreateDiveLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :dive_logs do |t|
      t.integer :dive_number, null: false
      t.string :spot_name, null: false
      t.date :date
      t.time :entry_time
      t.time :exit_time
      t.string :guide_name
      t.float :max_temp
      t.float :min_temp
      t.float :max_depth
      t.float :average_depth
      t.float :weight
      t.text :equipment

      t.timestamps
    end
  end
end
