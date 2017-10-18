describe Answer do
  describe 'validations' do
    let(:topic) { Topic.create(name: Faker::Lorem.word)}
    let(:user) {User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "somepassword123") }
    let(:trivia) { Trivia.create(title: Faker::Lorem.sentence,
                                 description: Faker::Lorem.paragraph,
                                 topic: topic,
                                 user: user )}
    let(:question) { Question.create(description: Faker::Lorem.sentence, trivia: trivia) }
    let(:answer) { Answer.create(description: "Some Answer", correct: 1, question: question)}

    it 'should fail validation if description is not present' do
      answer.description = nil

      expect(answer.valid?).to eql(false)
      expect(answer.errors[:description]).to be_present
    end

    it 'should fail validation if correct is not present' do
      answer.correct = nil

      expect(answer.valid?).to eql(false)
      expect(answer.errors[:correct]).to be_present
    end

    it 'should pass validation when all the attributes are correct' do
      expect(answer.valid?).to eql(true)
      expect(answer.errors[:correct]).not_to be_present
      expect(answer.errors[:description]).not_to be_present
    end
  end
end
