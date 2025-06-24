class AddShopNameToDiveLogs < ActiveRecord::Migration[8.0]
  def change
    add_column :dive_logs, :shop_name, :string, comment: 'Dive shop name'
  end
end
