class AddTankInfoToDiveLogs < ActiveRecord::Migration[8.0]
  def change
    add_column :dive_logs, :tank_material, :integer, default: 0, comment: '0: steel, 1: aluminum'
    add_column :dive_logs, :tank_capacity, :integer, comment: 'Tank capacity in liters'
  end
end
