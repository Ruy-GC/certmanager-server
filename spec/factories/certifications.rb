FactoryBot.define do
  factory :certification do
    certificationID { 1 }
    UID { "MyString" }
    title { "MyString" }
    type { "" }
    issue_date { "2023-04-22" }
    skills { "MyText" }
  end
end
