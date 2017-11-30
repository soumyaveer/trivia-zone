describe Question do
  describe 'validations' do
    let (:topic) do
      Topic.create(name: Faker::Lorem.word)
    end

    let(:trivia) do
      Trivia.create(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, topic: topic)
    end

    let(:question_1) do
      FactoryGirl.create(:question, trivia: trivia)
    end

    let(:question_2) do
      FactoryGirl.create(:question, trivia: trivia)
    end

    before do
      3.times do
        FactoryGirl.create(:answer, question: question_1, correct: false)
      end
      FactoryGirl.create(:answer, question: question_1, correct: true)

      4.times do
        FactoryGirl.create(:answer, question: question_2, correct:false)
      end
    end


    it 'should fail validation if description is not present' do
      question_1.description = nil

      expect(question_1.valid?).to eql(false)
      expect(question_1.errors[:description]).to be_present
    end

    it 'should pass validation with correct attributes' do
      expect(question_1.errors[:description]).not_to be_present
    end

    it 'should pass validation if atleast one correct answer is specified' do
      expect(question_1.errors[:answers]).not_to be_present
    end

    it 'should fail validation if none of the answers are marked as correct' do
      expect(question_2.errors.full_messages).to include("Answers should have atleast one correct value")
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
