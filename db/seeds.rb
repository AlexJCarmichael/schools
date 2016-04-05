# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

3.times do
  school = School.create!(name: Faker::Company.name, mascot: Faker::Superhero.name, address: Faker::Address.street_address)
  rand(5..10).times do
    teacher = Teacher.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                              address: Faker::Address.street_address, age: rand(22..75), school: school)
    rand(5..30).times do
      Student.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
                      address: Faker::Address.street_address, age: rand(18..75), school: school, teacher: teacher)
    end
  end
end
