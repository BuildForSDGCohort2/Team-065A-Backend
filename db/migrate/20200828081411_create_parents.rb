class CreateParents < ActiveRecord::Migration[6.0]
  def change
    create_table :parents do |t|
      t.string :mycourses

      t.timestamps
    end
  end
end
