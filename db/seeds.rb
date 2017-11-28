# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Topic.destroy_all
Trivia.destroy_all
TriviaSession.destroy_all
Question.destroy_all
Answer.destroy_all

# create Users
user1 = User.create(name: 'sam', email: 'sam@test.com', password: 'samtest123')
user2 = User.create(name: 'shanu', email: 'shanu@test.com', password: 'shanutest123')
user3 = User.create(name: 'rims', email: 'rims@test.com', password: 'rimstest123')

# create Topics
topic1 = Topic.create(name: 'Game of Thrones')
topic2 = Topic.create(name: 'Harry Potter')
topic3 = Topic.create(name: 'Hunger Games')


# create Trivias
trivia1 = Trivia.create(title: 'How well do you know Jon Snow?',
                        description: Faker::Lorem.sentence,
                        topic: topic1,
                        author: user1)

trivia2 = Trivia.create(title: 'Kings and Houses of Westros',
                        description: Faker::Lorem.sentence,
                        topic: topic1,
                        author: user2)


trivia3 = Trivia.create(title: 'Roberts Rebellion',
                        description: Faker::Lorem.sentence,
                        topic: topic1,
                        author: user3)


trivia4 = Trivia.create(title: 'House Stark',
                        description: Faker::Lorem.sentence,
                        topic: topic1,
                        author: user2)


trivia5 = Trivia.create(title: 'Hogwarts School of Wizardary and Witchcraft',
                        description: Faker::Lorem.sentence,
                        topic_id: topic2.id,
                        author: user2)

trivia6 = Trivia.create(title: 'Hogwarts Professors',
                        description: Faker::Lorem.sentence,
                        topic_id: topic2.id,
                        author: user1)

trivia7 = Trivia.create(title: 'Defence Against the Dark Arts',
                        description: Faker::Lorem.sentence,
                        topic_id: topic2.id,
                        author: user3)

trivia8 = Trivia.create(title: 'Transfiguration with Professor Mcgonegal',
                        description: Faker::Lorem.sentence,
                        topic_id: topic2.id,
                        author: user2)

trivia9 = Trivia.create(title: 'Catching Fire',
                        description: Faker::Lorem.sentence,
                        topic_id: topic3.id,
                        author: user1)

trivia10 = Trivia.create(title: 'Katniss Everdeen & Tributes',
                        description: Faker::Lorem.sentence,
                        topic_id: topic3.id,
                         author: user1)


trivia11 = Trivia.create(title: 'MockingJay',
                        description: Faker::Lorem.sentence,
                        topic_id: topic3.id,
                         author: user3)


trivia12 = Trivia.create(title: 'Districts & History of Panem',
                        description: Faker::Lorem.sentence,
                        topic_id: topic3.id,
                         author: user2)

# create TriviaSession

TriviaSession.create(user_id: user2.id, trivia_id: trivia1.id)
TriviaSession.create(user_id: user1.id, trivia_id: trivia2.id)
TriviaSession.create(user_id: user1.id, trivia_id: trivia3.id)
TriviaSession.create(user_id: user3.id, trivia_id: trivia4.id)
TriviaSession.create(user_id: user2.id, trivia_id: trivia5.id)
TriviaSession.create(user_id: user1.id, trivia_id: trivia6.id)
TriviaSession.create(user_id: user2.id, trivia_id: trivia7.id)
TriviaSession.create(user_id: user3.id, trivia_id: trivia8.id)
TriviaSession.create(user_id: user3.id, trivia_id: trivia9.id)
TriviaSession.create(user_id: user1.id, trivia_id: trivia10.id)
TriviaSession.create(user_id: user2.id, trivia_id: trivia11.id)
TriviaSession.create(user_id: user1.id, trivia_id: trivia12.id)

# create Questions for trivia1

question1 = Question.create(description: Faker::Lorem.sentence, trivia_id: trivia1.id)
question2 = Question.create(description: Faker::Lorem.sentence, trivia_id: trivia1.id)
question3 = Question.create(description: Faker::Lorem.sentence, trivia_id: trivia1.id)
question4 = Question.create(description: Faker::Lorem.sentence, trivia_id: trivia1.id)
question5 = Question.create(description: Faker::Lorem.sentence, trivia_id: trivia1.id)
question6 = Question.create(description: Faker::Lorem.sentence, trivia_id: trivia1.id)
question7 = Question.create(description: Faker::Lorem.sentence, trivia_id: trivia1.id)
question8 = Question.create(description: Faker::Lorem.sentence, trivia_id: trivia1.id)
question9 = Question.create(description: Faker::Lorem.sentence, trivia_id: trivia1.id)
question10 = Question.create(description: Faker::Lorem.sentence, trivia_id: trivia1.id)


# create answers for trivia1
3.times do
  Answer.create(description: Faker::Lorem.word, question_id: question1.id)
end
Answer.create(description: Faker::Lorem.word, correct: 1, question_id: question1.id)

3.times do
  Answer.create(description: Faker::Lorem.word, question_id: question2.id)
end
Answer.create(description: Faker::Lorem.word, correct: 1, question_id: question2.id)

3.times do
  Answer.create(description: Faker::Lorem.word, question_id: question3.id)
end
Answer.create(description: Faker::Lorem.word, correct: 1, question_id: question3.id)


3.times do
  Answer.create(description: Faker::Lorem.word, question_id: question4.id)
end
Answer.create(description: Faker::Lorem.word, correct: 1, question_id: question4.id)


3.times do
  Answer.create(description: Faker::Lorem.word, question_id: question5.id)
end
Answer.create(description: Faker::Lorem.word, correct: 1, question_id: question5.id)


3.times do
  Answer.create(description: Faker::Lorem.word, question_id: question6.id)
end
Answer.create(description: Faker::Lorem.word, correct: 1, question_id: question6.id)


3.times do
  Answer.create(description: Faker::Lorem.word, question_id: question7.id)
end
Answer.create(description: Faker::Lorem.word, correct: 1, question_id: question7.id)


3.times do
  Answer.create(description: Faker::Lorem.word, question_id: question8.id)
end
Answer.create(description: Faker::Lorem.word, correct: 1, question_id: question8.id)


3.times do
  Answer.create(description: Faker::Lorem.word, question_id: question9.id)
end
Answer.create(description: Faker::Lorem.word, correct: 1, question_id: question9.id)


3.times do
  Answer.create(description: Faker::Lorem.word, question_id: question10.id)
end
Answer.create(description: Faker::Lorem.word, correct: 1, question_id: question10.id)
