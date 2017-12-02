FactoryBot.define do
  factory :topic do
    name { Faker::Lorem.sentence }
  end
end
