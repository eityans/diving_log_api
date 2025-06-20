class AddUniqueIndexToDiveLogsOnDiveNumberAndUserId < ActiveRecord::Migration[7.0]
  def change
    add_index :dive_logs, [ :dive_number, :user_id ], unique: true
  end
end
