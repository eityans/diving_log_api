class AddAirRemainingToDiveLogs < ActiveRecord::Migration[8.0]
  def change
    add_column :dive_logs, :air_remaining, :integer, comment: 'Remaining air pressure in bar'
  end
end
