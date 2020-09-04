class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :description

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
      t.timestamps
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
      t.float :rating, limit: 5, default: 5.0

      t.timestamps
    end

    create_table :posts do |t|
      t.belongs_to :teacher
      t.string :content
      t.string :title

      t.timestamps
    end
  end
end
