class AddTankInfoToDiveLogs < ActiveRecord::Migration[8.0]
  def change
    add_column :dive_logs, :tank_material, :integer, comment: '1: steel, 2: aluminum'
    add_column :dive_logs, :tank_capacity, :integer, comment: 'Tank capacity in liters'
  end
end
