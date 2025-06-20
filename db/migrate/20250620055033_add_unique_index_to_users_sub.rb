class AddUniqueIndexToUsersSub < ActiveRecord::Migration[8.0]
  def change
    add_index :users, :sub, unique: true
  end
end
