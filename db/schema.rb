# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_11_103438) do

  create_table "courses", force: :cascade do |t|
    t.string "coursename"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "educations", force: :cascade do |t|
    t.integer "teacher_id"
    t.string "institution"
    t.string "certificate"
    t.integer "year_from"
    t.integer "year_to"
    t.string "certificate_proof"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_educations_on_teacher_id"
  end

  create_table "others", force: :cascade do |t|
    t.string "mycourses"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "age"
    t.string "level"
  end

  create_table "parents", force: :cascade do |t|
    t.string "mycourses"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "age"
    t.string "level"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "teacher_id"
    t.text "content", limit: 16777215
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_posts_on_teacher_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "parent_id"
    t.integer "school_id"
    t.integer "other_id"
    t.integer "student_id"
    t.string "owner"
    t.string "teacher"
    t.text "content", limit: 16777215
    t.float "rating", limit: 5, default: 5.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["other_id"], name: "index_reviews_on_other_id"
    t.index ["parent_id"], name: "index_reviews_on_parent_id"
    t.index ["school_id"], name: "index_reviews_on_school_id"
    t.index ["student_id"], name: "index_reviews_on_student_id"
    t.index ["teacher_id"], name: "index_reviews_on_teacher_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "mycourses"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "age"
    t.string "level"
  end

  create_table "students", force: :cascade do |t|
    t.string "mycourses"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "age"
    t.string "level"
  end

  create_table "teachers", force: :cascade do |t|
    t.text "description", limit: 16777215
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teachers_courses", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "course_id"
    t.index ["course_id"], name: "index_teachers_courses_on_course_id"
    t.index ["teacher_id"], name: "index_teachers_courses_on_teacher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone"
    t.string "user_type"
    t.string "userref_type"
    t.integer "userref_id"
    t.string "gender"
    t.string "country"
    t.string "state"
    t.string "address"
    t.string "avatar"
    t.string "forgot_password_digest"
    t.datetime "forgot_password_sent_at"
    t.string "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["userref_type", "userref_id"], name: "index_users_on_userref_type_and_userref_id"
  end

end
