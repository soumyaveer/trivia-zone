# Creates a sample data-set for development
raise "Should only be run in development. Current environment is #{Rails.env}" unless Rails.env.development?

DatabaseCleaner.clean_with :truncation

user_1 = User.create!(name: 'sam', email: 'sam@test.com', password: 'samtest123')
user_2 = User.create!(name: 'shanu', email: 'shanu@test.com', password: 'shanutest123')
user_3 = User.create!(name: 'rims', email: 'rims@test.com', password: 'rimstest123')

# create Topics
topic_1 = Topic.create!(name: 'Game of Thrones')
topic_2 = Topic.create!(name: 'Harry Potter')
topic_3 = Topic.create!(name: 'Hunger Games')

# create Trivias
trivia_1 = Trivia.create!(
  title: 'How well do you know Jon Snow?',
  description: Faker::Lorem.sentence,
  topic: topic_1,
  author: user_1
)

trivia_2 = Trivia.create!(
  title: 'Kings and Houses of Westros',
  description: Faker::Lorem.sentence,
  topic: topic_1,
  author: user_2
)

trivia_3 = Trivia.create!(
  title: 'Roberts Rebellion',
  description: Faker::Lorem.sentence,
  topic: topic_1,
  author: user_3
)

# create TriviaSession

trivia_session_1 = TriviaSession.create!(player_id: user_1.id, trivia_id: trivia_1.id, feedback: "yes")
trivia_session_2 = TriviaSession.create!(player_id: user_1.id, trivia_id: trivia_2.id, feedback: "no")
trivia_session_3 = TriviaSession.create!(player_id: user_2.id, trivia_id: trivia_1.id, feedback: "yes")
trivia_session_4 = TriviaSession.create!(player_id: user_2.id, trivia_id: trivia_3.id, feedback: "yes")
trivia_session_5 = TriviaSession.create!(player_id: user_3.id, trivia_id: trivia_2.id, feedback: "yes")
trivia_session_6 = TriviaSession.create!(player_id: user_3.id, trivia_id: trivia_3.id, feedback: "yes")

# create Questions for trivia1
question_11 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_12 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_13 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_14 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_15 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_16 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_17 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_18 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_19 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_110 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)


#create Questions for trivia2
question_21 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_2.id)
question_22 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_2.id)
question_23 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_2.id)
question_24 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_2.id)
question_25 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_2.id)
question_26 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_2.id)
question_27 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_2.id)
question_28 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_2.id)
question_29 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_2.id)
question_210 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_2.id)


# create Questions for trivia3

question_31 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_3.id)
question_32 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_3.id)
question_33 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_3.id)
question_34 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_3.id)
question_35 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_3.id)
question_36 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_3.id)
question_37 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_3.id)
question_38 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_3.id)
question_39 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_3.id)
question_310 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_3.id)

# create answers for trivia1
3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_11.id)
end
answer_1 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_11.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_12.id)
end
answer_2 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_12.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_13.id)
end
answer_3 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_13.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_14.id)
end
answer_4 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_14.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_15.id)
end
answer_5 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_15.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_16.id)
end
answer_6 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_16.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_17.id)
end
answer_7 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_17.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_18.id)
end
answer_8 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_18.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_19.id)
end
answer_9 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_19.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_110.id)
end
answer_10 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_110.id)

# create answers for trivia2
3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_21.id)
end
answer_11 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_21.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_22.id)
end
answer_12 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_22.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_23.id)
end
answer_13 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_23.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_24.id)
end
answer_14 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_24.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_25.id)
end
answer_15 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_25.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_26.id)
end
answer_16 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_26.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_27.id)
end
answer_17 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_27.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_28.id)
end
answer_18 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_28.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_29.id)
end
answer_19 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_29.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_210.id)
end
answer_20 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_210.id)

# create answers for trivia1
3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_31.id)
end
answer_21 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_31.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_32.id)
end
answer_22 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_32.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_33.id)
end
answer_23 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_33.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_34.id)
end
answer_24 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_34.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_35.id)
end
answer_25 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_35.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_36.id)
end
answer_26 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_36.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_37.id)
end
answer_27 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_37.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_38.id)
end
answer_28 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_38.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_39.id)
end
answer_29 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_39.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_310.id)
end
answer_30 = Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_310.id)

# create Answer_Trivias for trivia_session_1
trivia_session_1.answers = [
  answer_1,
  answer_1,
  answer_2,
  answer_4,
  answer_6,
  answer_8,
  answer_9,
  answer_10,
  answer_30,
  answer_30
]

trivia_session_1.save!

# create Answer_Trivias for trivia_session_2
trivia_session_2.answers = [
  answer_30,
  answer_12,
  answer_30,
  answer_14,
  answer_15,
  answer_16,
  answer_17,
  answer_18,
  answer_19,
  answer_30
]

trivia_session_2.save!

# create Answer_Trivias for trivia_session_3
trivia_session_3.answers = [
  answer_1,
  answer_2,
  answer_3,
  answer_4,
  answer_5,
  answer_6,
  answer_7,
  answer_8,
  answer_9,
  answer_1
]

trivia_session_3.save!

# create Answer_Trivias for trivia session_4
trivia_session_4.answers = [
  answer_21,
  answer_1,
  answer_23,
  answer_24,
  answer_25,
  answer_26,
  answer_27,
  answer_1,
  answer_1,
  answer_1
]

trivia_session_4.save!


# create Answer_Trivias for trivia session_5
trivia_session_5.answers = [
  answer_11,
  answer_12,
  answer_13,
  answer_1,
  answer_15,
  answer_16,
  answer_1,
  answer_18,
  answer_19,
  answer_20
]

trivia_session_5.save!


# create Answer_Trivias for trivia session_6
trivia_session_6.answers = [
  answer_21,
  answer_22,
  answer_23,
  answer_24,
  answer_25,
  answer_26,
  answer_27,
  answer_28,
  answer_29,
  answer_30
]

trivia_session_6.save!
