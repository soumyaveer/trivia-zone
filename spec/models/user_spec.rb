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
    let(:author) { User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'testpass123')}

    let (:topic) do
      Topic.create(name: Faker::Lorem.word)
    end

    before do
      @trivia1 = create_trivia(6, topic)
      @trivia2 = create_trivia(6, topic)

      @trivia_session1 = create_trivia_session_with(3, author, @trivia1)
      @trivia_session2 = create_trivia_session_with(8, author, @trivia2)
    end

    it 'has many trivia' do
      expect(author.trivias).to match_array([@trivia1, @trivia2])
    end
  end

  describe "authored trivias" do
    it "returns trivias authored by the specified user" do
      user = FactoryGirl.create(:user)

      trivia_1 = FactoryGirl.create(:trivia, author: user)
      trivia_2 = FactoryGirl.create(:trivia, author: user)

      expect(user.reload.authored_trivias).to match_array([trivia_1, trivia_2])
    end
  end

  describe "topic_score" do
    it "returns the sum of max scores of all trivias played in this topic" do
      topic_1 = FactoryGirl.create(:topic)
      topic_2 = FactoryGirl.create(:topic)
      trivia_1 = create_trivia(6, topic_1)
      trivia_2 = create_trivia(10, topic_1)
      trivia_3 = create_trivia(10, topic_2)

      player = FactoryGirl.create(:user)
      create_trivia_session_with(3, player, trivia_1) # Score 50
      create_trivia_session_with(4, player, trivia_1) # Score 66
      create_trivia_session_with(8, player, trivia_2) # Score 80
      create_trivia_session_with(10, player, trivia_3) # Score 100

      expect(player.topic_score(topic_1).round(2)).to eql(146.67)
      expect(player.topic_score(topic_2)).to eql(100.0)
    end
  end
end
