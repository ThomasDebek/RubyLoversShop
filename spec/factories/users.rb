FactoryBot.define do
  factory :user do
    #first_name "Tomasz"
    #last_name "Debek"
    sequence(:email) { |n| "tester#{n}@example.com" }
    password {"secret" }
  end
end
