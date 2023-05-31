require 'faker'

FactoryBot.define do
  factory :employee do
    id { Faker::Alphanumeric.alpha(number: 11) }
    org { "Organization" }
    work_location { "Location" }
  end
end
