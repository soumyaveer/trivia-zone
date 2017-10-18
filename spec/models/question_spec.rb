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
end
