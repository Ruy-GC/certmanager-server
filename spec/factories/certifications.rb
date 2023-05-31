require 'faker'

FactoryBot.define do
  factory :certification do
    title { Faker::Book.title }
    category { "Category" }
    skills { "skills" }
  end
end
