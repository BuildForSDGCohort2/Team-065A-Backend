class AddAgeAnd < ActiveRecord::Migration[6.0]
  def change
    add_column :parents, :age, :integer
    add_column :parents, :level, :string
    add_column :others, :age, :integer
    add_column :others, :level, :string
    add_column :schools, :age, :integer
    add_column :schools, :level, :string
  end
end
