class AddNewColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :phone, :string
    add_column :users, :user_type, :string
  end
end
