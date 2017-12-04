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

trivia_4 = Trivia.create!(
  title: 'House Stark',
  description: Faker::Lorem.sentence,
  topic: topic_1,
  author: user_2
)

trivia_5 = Trivia.create!(
  title: 'Hogwarts School of Wizardary and Witchcraft',
  description: Faker::Lorem.sentence,
  topic_id: topic_2.id,
  author: user_2
)

trivia_6 = Trivia.create!(
  title: 'Hogwarts Professors',
  description: Faker::Lorem.sentence,
  topic_id: topic_2.id,
  author: user_1
)

trivia_7 = Trivia.create!(
  title: 'Defence Against the Dark Arts',
  description: Faker::Lorem.sentence,
  topic_id: topic_2.id,
  author: user_3
)

trivia_8 = Trivia.create!(
  title: 'Transfiguration with Professor Mcgonegal',
  description: Faker::Lorem.sentence,
  topic_id: topic_2.id,
  author: user_2
)

trivia_9 = Trivia.create!(
  title: 'Catching Fire',
  description: Faker::Lorem.sentence,
  topic_id: topic_3.id,
  author: user_1
)

trivia_10 = Trivia.create!(
  title: 'Katniss Everdeen & Tributes',
  description: Faker::Lorem.sentence,
  topic_id: topic_3.id,
  author: user_1
)

trivia_11 = Trivia.create!(
  title: 'MockingJay',
  description: Faker::Lorem.sentence,
  topic_id: topic_3.id,
  author: user_3
)

trivia_12 = Trivia.create!(
  title: 'Districts & History of Panem',
  description: Faker::Lorem.sentence,
  topic_id: topic_3.id,
  author: user_2
)

# create TriviaSession

TriviaSession.create!(player_id: user_2.id, trivia_id: trivia_1.id, feedback:"yes")
TriviaSession.create!(player_id: user_1.id, trivia_id: trivia_2.id, feedback: "no")
TriviaSession.create!(player_id: user_1.id, trivia_id: trivia_3.id, feedback: "yes")
TriviaSession.create!(player_id: user_3.id, trivia_id: trivia_4.id, feedback: "yes")
TriviaSession.create!(player_id: user_2.id, trivia_id: trivia_5.id, feedback: "yes")
TriviaSession.create!(player_id: user_1.id, trivia_id: trivia_6.id, feedback: "yes")
TriviaSession.create!(player_id: user_2.id, trivia_id: trivia_7.id, feedback: "yes")
TriviaSession.create!(player_id: user_3.id, trivia_id: trivia_8.id, feedback: "yes")
TriviaSession.create!(player_id: user_3.id, trivia_id: trivia_9.id, feedback: "yes")
TriviaSession.create!(player_id: user_1.id, trivia_id: trivia_10.id, feedback: "yes")
TriviaSession.create!(player_id: user_2.id, trivia_id: trivia_11.id, feedback: "no")
TriviaSession.create!(player_id: user_1.id, trivia_id: trivia_12.id, feedback: "yes")

# create Questions for trivia1

question_1 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_2 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_3 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_4 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_5 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_6 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_7 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_8 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_9 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)
question_10 = Question.create!(description: Faker::Lorem.sentence, trivia_id: trivia_1.id)

# create answers for trivia1
3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_1.id)
end
Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_1.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_2.id)
end
Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_2.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_3.id)
end
Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_3.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_4.id)
end
Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_4.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_5.id)
end
Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_5.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_6.id)
end
Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_6.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_7.id)
end
Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_7.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_8.id)
end
Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_8.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_9.id)
end
Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_9.id)

3.times do
  Answer.create!(description: Faker::Lorem.word, question_id: question_10.id)
end
Answer.create!(description: Faker::Lorem.word, correct: true, question_id: question_10.id)
