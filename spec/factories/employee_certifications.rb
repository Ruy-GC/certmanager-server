require 'faker'

FactoryBot.define do
  factory :employee_certification do
    employee
    certification
    issued_date {Faker::Date.between(from: 24.months.ago, to: Date.today)}
  end
end
