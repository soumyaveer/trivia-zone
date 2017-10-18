describe Trivia do
  describe 'validations' do
    let(:topic) { Topic.create(name: Faker::Lorem.word)}
    let (:user) {User.create(name: 'sam', email: 'sam@test.com', password: 'samtest@123')}
    let(:trivia) do
      Trivia.create(title: "House Stark",
                    description: "This Trivia is related to the history and members of House Stark",
                    topic_id: topic.id,
                    user_id: user.id)
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
                                 user_id: user.id)

      expect(new_trivia.valid?).to eql(false)
      expect(new_trivia.errors[:title]).to be_present
    end

    it 'should pass validation if attributes are correct' do
      expect(trivia.valid?).to eql(true)
      expect(trivia.errors[:title]).not_to be_present
    end
  end
end
