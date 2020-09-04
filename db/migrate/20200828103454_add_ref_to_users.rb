class AddRefToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :userref, polymorphic: true,
    add_column :users, :gender, :string
    add_column :users, :country, :string
    add_column :users, :state, :string
    add_column :users, :address, :string
    add_column :users, :avatar, :string
  end
end
