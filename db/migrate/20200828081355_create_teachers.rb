class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.float :rating
      t.string :description
      t.string :courses

      t.timestamps
    end

    create_table :educations do |t|
      t.belongs_to :teacher
      t.string :institution
      t.string :certificate
      t.integer :year_from
      t.integer :year_to
      t.string :certificate_proof # might be pdf,jpg,png

      t.timestamps
    end

    create_table :courses do |t|
      t.string :coursename
      t.belongs_to :student
      t.timestamps
    end

    create_table :teachers_courses, id: false do |t|
      t.belongs_to :teacher
      t.belongs_to :course
    end

    create_table :reviews do |t|
      t.belongs_to :teacher
      t.belongs_to :parent
      t.belongs_to :school
      t.belongs_to :other
      t.belongs_to :student
      t.string :owner
      t.string :teacher
      t.string :content

      t.timestamps
    end

    create_table :ratings do |t|
      t.belongs_to :review
      t.float :rate, default: 5.0, limit: 5.0
      t.timestamps
    end

    create_table :posts do |t|
      t.belongs_to :teacher
      t.string :content

      t.timestamps
    end
  end
end
