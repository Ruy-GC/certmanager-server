# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do
    User.create({
        UID: Faker::IDNumber.valid,
        email: Faker::Internet.email,
        password: Faker::Number.number(digits: 10),
        org: Faker::Job.title,
        work_location: Faker::Address.city
    })
end
