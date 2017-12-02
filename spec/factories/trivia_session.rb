FactoryBot.define do
  factory :trivia_session do
    association :player, factory: :user
    trivia
  end
end
