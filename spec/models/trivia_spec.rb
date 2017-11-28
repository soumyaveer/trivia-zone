describe Trivia do
  describe 'validations' do
    let(:topic) { Topic.create(name: Faker::Lorem.word)}
    let (:author) { User.create(name: 'sam', email: 'sam@test.com', password: 'samtest@123') }

    let(:trivia) do
      Trivia.create(title: "House Stark",
                    description: "This Trivia is related to the history and members of House Stark",
                    topic: topic,
                    author: author)
    end

    it 'should fail validation if title is not present' do
      trivia.title = nil

      expect(trivia.valid?).to eql(false)
      expect(trivia.errors[:title]).to be_present
    end

    it 'should fail validation if title is not unique' do
      new_trivia = Trivia.create(title: trivia.title,
                                 description: "Another description",
                                 topic_id: topic.id,
                                 author: author)

      expect(new_trivia.valid?).to eql(false)
      expect(new_trivia.errors[:title]).to be_present
    end

    it 'should pass validation if attributes are correct' do
      expect(trivia.valid?).to eql(true)
      expect(trivia.errors[:title]).not_to be_present
    end
  end

  describe 'relationship' do
    let(:author) do
      User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "testpassword123")
    end

    let (:topic) do
      Topic.create(name: Faker::Lorem.word)
    end

    let(:trivia) do
      Trivia.create(title: Faker::Lorem.sentence,
                    description: Faker::Lorem.paragraph,
                    topic: topic,
                    author: author)
    end

    before do
      @question1 = Question.create(description: Faker::Lorem.sentence, trivia: trivia)
      @question2 = Question.create(description: Faker::Lorem.sentence, trivia: trivia)
      @question3 = Question.create(description: Faker::Lorem.sentence, trivia: trivia)
    end

    it ' has_many questions' do
      expect(trivia.questions).to match_array([@question1, @question2, @question3])
    end

    it 'belongs to topic' do
      expect(trivia.topic).to eql(topic)
    end

    it 'is created by an author' do
      expect(trivia.author).to eql(author)
    end
  end
end
