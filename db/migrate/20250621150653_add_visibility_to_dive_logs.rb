class AddVisibilityToDiveLogs < ActiveRecord::Migration[8.0]
  def change
    add_column :dive_logs, :visibility, :integer, comment: 'Visibility in meters'
  end
end
