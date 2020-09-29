require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

usertypes = %w[student teacher parent others school]
usertype_models = [Student, Teacher, Parent, Other, School]
levels = ['Nursery', 'Primary', 'Junior Secondary', 'Senior Secondary', 'University']
all_teachers = []

# create diff users
20.times do |_x|
  rand_index = rand(0..4)
  rand_password = Faker::Internet.password(min_length: 10)
  rand_name = Faker::Name.unique.name
  rand_email = Faker::Internet.email(name: rand_name)

  user = User.create(
    full_name: rand_name,
    email: rand_email,
    password: rand_password,
    phone: '+2349098501002',
    user_type: usertypes[rand_index],
    gender: Faker::Gender.binary_type,
    country: Faker::Address.country,
    state: Faker::Address.state,
    address: Faker::Address.full_address,
    avatar: Faker::Avatar.image
  )

  user.userref = usertype_models[rand_index].new
  user.save

  if user.userref.is_a? Teacher
    all_teachers << user.id
    user.userref.update(
      description: Faker::Quote.matz
    )
    years = rand(4..9)
    year_fr = rand(1960..2011)
    user.userref.educations << Education.create(
      institution: Faker::Educator.university,
      year_from: year_fr,
      year_to: year_fr + years,
      certificate: Faker::Educator.degree,
      certificate_proof: Faker::Avatar.image
    )
    user.userref.posts << Post.create(
      title: Faker::Educator.course_name,
      content: Faker::Lorem.paragraph(sentence_count: rand(10..20))
    )
    user.userref.posts << Post.create(
      title: Faker::Educator.course_name,
      content: Faker::Lorem.paragraph(sentence_count: rand(10..20))
    )
    user.userref.courses << Course.create(coursename: Faker::Educator.unique.subject)
    user.userref.courses << Course.create(coursename: Faker::Educator.unique.subject)
    user.userref.courses << Course.create(coursename: Faker::Educator.unique.subject)
  else
    user.userref.update(
      age: rand(10..100),
      level: levels[rand(0..4)],
      mycourses: 'Maths, English, Biology, Basic Tech'
    )
  end
  user.save
end

User.all.each do |x|
  teacherid = all_teachers.sample
  next if teacherid == x.id

  x.userref.reviews << Review.create(
    owner: x.full_name,
    teacher: User.find(teacherid).full_name,
    teacher_id: teacherid,
    content: Faker::Lorem.paragraph(sentence_count: rand(1..3)),
    rating: rand(1..5)
  )
end
