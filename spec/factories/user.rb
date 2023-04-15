FactoryBot.define do
    factory :user do
        UID {Faker::IDNumber.valid}
        email {Faker::Internet.email}
        password {Faker::Number.number(digits: 10)}
        org {Faker::Job.title}
        work_location {Faker::Address.city}
    end
end