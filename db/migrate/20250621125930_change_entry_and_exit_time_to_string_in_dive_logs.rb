class ChangeEntryAndExitTimeToStringInDiveLogs < ActiveRecord::Migration[8.0]
  def change
    change_column :dive_logs, :entry_time, :string
    change_column :dive_logs, :exit_time, :string
  end
end
