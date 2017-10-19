describe User do
  describe 'validations' do
    let(:user) { User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'testpass123')}

    it 'should fail validation if user\'s name is not present' do
      user.name = nil
      expect(user.valid?).to eql(false)
      expect(user.errors[:name]).to be_present
    end

    it 'should fail validation if user\'s email is not present' do
      user.email = nil

      expect(user.valid?).to eql(false)
      expect(user.errors[:email]).to be_present
    end

    it 'should fail validation is password is not present' do
      user.password = nil

      expect(user.valid?).to eql(false)
      expect(user.errors[:password]).to be_present
    end

    it 'should pass validation is all the attributes are present' do
      expect(user.valid?).to eql(true)
    end
  end

  describe 'relationship' do
    let(:user) { User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'testpass123')}

    let (:topic) do
      Topic.create(name: Faker::Lorem.word)
    end

    before do
      @trivia1 = Trivia.create(title: Faker::Lorem.sentence,
                    description: Faker::Lorem.paragraph,
                    topic: topic,
                    user: user)

      @trivia2 = Trivia.create(title: Faker::Lorem.sentence,
                               description: Faker::Lorem.paragraph,
                               topic: topic,
                               user: user)

      @trivia_session1 = TriviaSession.create(trivia: @trivia1, user: user, score: 30)
      @trivia_session2 = TriviaSession.create(trivia: @trivia2, user: user, score: 70)

    end

    it 'has many trivia' do
      expect(user.trivias).to match_array([@trivia1, @trivia2])
    end
  end
end
