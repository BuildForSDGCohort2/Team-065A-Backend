class AddRefToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :userref, null: false, foreign_key: true
  end
end
