class AddMemoAndNotNullDateToDiveLogs < ActiveRecord::Migration[8.0]
  def change
    change_column_null :dive_logs, :date, false
    add_column :dive_logs, :memo, :text
  end
end
