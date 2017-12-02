describe Answer do
  describe 'validations' do
    let(:topic) { Topic.create(name: Faker::Lorem.word) }
    let(:user) { User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "somepassword123") }
    let(:trivia) { Trivia.create(title: Faker::Lorem.sentence,
                                 description: Faker::Lorem.paragraph,
                                 topic: topic,
                                 author: user) }
    let(:question) { Question.create(description: Faker::Lorem.sentence, trivia: trivia) }
    let(:answer) { Answer.create(description: "Some Answer", correct: 1, question: question) }

    it 'should fail validation if description is not present' do
      answer.description = nil

      expect(answer.valid?).to eql(false)
      expect(answer.errors[:description]).to be_present
    end

    it 'should pass validation when all the attributes are correct' do
      expect(answer.valid?).to eql(true)
      expect(answer.errors[:description]).not_to be_present
    end
  end

  describe 'relationship' do
    let(:user) do
      User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "testpassword123")
    end

    let(:topic) do
      Topic.create(name: Faker::Lorem.word)
    end

    let(:trivia) do
      Trivia.create(title: Faker::Lorem.sentence,
                    description: Faker::Lorem.paragraph,
                    topic: topic,
                    author: user)
    end


    before do
      @question_1 = Question.create(description: Faker::Lorem.sentence, trivia: trivia)
      @question_2 = Question.create(description: Faker::Lorem.sentence, trivia: trivia)

      @answer_1 = Answer.create(description: Faker::Lorem.word, question: @question_1)
      @answer_2 = Answer.create(description: Faker::Lorem.word,  question: @question_2)
    end

    it 'should belong to a question' do
      expect(@answer_1.question).to eql(@question_1)
      expect(@answer_2.question).to eql(@question_2)
    end
  end

  describe "correct" do
    let(:author) do
      FactoryBot.create(:user)
    end

    let(:topic) do
      FactoryBot.create(:topic)
    end

    let(:trivia) do
      FactoryBot.create(:trivia, topic: topic, author: author)
    end

    before do
      @question_1 = FactoryBot.create(:question, trivia: trivia)
      @question_2 = FactoryBot.create(:question, trivia: trivia)

      @answer_1_for_question_1 = FactoryBot.create(:answer, question: @question_1, correct: false)
      @answer_2_for_question_1 = FactoryBot.create(:answer, question: @question_1, correct: true)
      @answer_1_for_question_2 = FactoryBot.create(:answer, question: @question_1, correct: true)
      @answer_2_for_question_2 = FactoryBot.create(:answer, question: @question_1, correct: false)
    end

    it "returns the correct answers" do
      expect(Answer.correct).to match_array([@answer_2_for_question_1, @answer_1_for_question_2])
    end
  end

  describe "incorrect" do
    let(:author) do
      FactoryBot.create(:user)
    end

    let(:topic) do
      FactoryBot.create(:topic)
    end

    let(:trivia) do
      FactoryBot.create(:trivia, topic: topic, author: author)
    end

    before do
      @question_1 = FactoryBot.create(:question, trivia: trivia)
      @question_2 = FactoryBot.create(:question, trivia: trivia)

      @answer_1_for_question_1 = FactoryBot.create(:answer, question: @question_1, correct: false)
      @answer_2_for_question_1 = FactoryBot.create(:answer, question: @question_1, correct: true)
      @answer_1_for_question_2 = FactoryBot.create(:answer, question: @question_1, correct: true)
      @answer_2_for_question_2 = FactoryBot.create(:answer, question: @question_1, correct: false)
    end

    it "returns the incorrect answers" do
      expect(Answer.incorrect).to match_array([@answer_1_for_question_1, @answer_2_for_question_2])
    end
  end
end
