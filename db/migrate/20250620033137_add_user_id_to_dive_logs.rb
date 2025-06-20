class AddUserIdToDiveLogs < ActiveRecord::Migration[8.0]
  def change
    add_reference :dive_logs, :user, null: false, foreign_key: true
  end
end
