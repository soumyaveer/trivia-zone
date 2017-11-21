FactoryGirl.define do
  factory :trivia do
    association :author, factory: :user
    title { Faker::Lorem.sentence }
    topic
  end
end
