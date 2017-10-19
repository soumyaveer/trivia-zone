describe Question do
  describe 'validations' do
    let (:topic) do
      Topic.create(name: Faker::Lorem.word)
    end

    let(:trivia) do
      Trivia.create(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, topic: topic)
    end

    let(:question) do
      Question.create(description: "Who was Catelyn Stark?", trivia: trivia)
    end

    it 'should fail validation if description is not present' do
      question.description = nil

      expect(question.valid?).to eql(false)
      expect(question.errors[:description]).to be_present
    end

    it 'should pass validation with correct attributes' do
      expect(question.errors[:description]).not_to be_present
    end
  end

  describe 'relationship' do
    let(:user) do
      User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "testpassword123")
    end

    let (:topic) do
      Topic.create(name: Faker::Lorem.word)
    end

    let(:trivia) do
      Trivia.create(title: Faker::Lorem.sentence,
                    description: Faker::Lorem.paragraph,
                    topic: topic,
                    user: user)
    end

    let(:question) do
      Question.create(description: "Who was Catelyn Stark?", trivia: trivia)
    end

    before do
      @answer1 = Answer.create(description: Faker::Lorem.word, question: question)
      @answer2 = Answer.create(description: Faker::Lorem.word,  question: question)
      @answer3 = Answer.create(description: Faker::Lorem.word,  question: question)
      @answer4 = Answer.create(description: Faker::Lorem.word, correct: 1,  question: question)
    end

    it 'should have four answer options' do
      expect(question.answers).to match_array([@answer1, @answer2, @answer3, @answer4])
    end

    it 'belongs to a trivia' do
      expect(question.trivia).to eql(trivia)
    end
  end
end
