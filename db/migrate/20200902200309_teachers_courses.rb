class TeachersCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers_courses do |t|
      t.belongs_to :teacher, index: true
      t.belongs_to :course, index: true
    end
  end
end
