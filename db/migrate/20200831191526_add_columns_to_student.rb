class AddColumnsToStudent < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :age, :integer
    add_column :students, :level, :string
  end
end
