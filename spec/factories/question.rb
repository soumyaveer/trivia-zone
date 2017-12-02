FactoryBot.define do
  factory :question do
    description { Faker::Lorem.sentence }
    trivia
  end
end
