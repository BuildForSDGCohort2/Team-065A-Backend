class AddIndexToUsersEmailAndFullname < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :email, unique: true
    add_index :users, :full_name, unique: true
  end
end
