class AddPointNameToDiveLogs < ActiveRecord::Migration[8.0]
  def change
    add_column :dive_logs, :point_name, :string, comment: 'Dive point name'
  end
end
