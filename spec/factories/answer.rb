FactoryGirl.define do
  factory :answer do
    description { Faker::Lorem.sentence }
    question
  end
end
