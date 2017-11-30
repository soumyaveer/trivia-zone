describe Topic do
  describe 'validations' do
    let(:topic) do
      Topic.create( name: "Game of Thrones")
    end

    it 'should fail validation if name is not present' do
      topic.name = nil

      expect(topic.valid?).to eql(false)
      expect(topic.errors[:name]).to be_present
    end

    it 'should fail validation if name is not unique' do
      new_topic = Topic.create
      new_topic.name = "Game of Thrones"

      expect(new_topic.errors[:name]).to be_present
    end

    it 'should pass validation with correct attributes' do
      expect(topic.valid?).to eql(true)
      expect(topic.errors[:name]).not_to be_present
    end
  end

  describe 'relationship' do
    let(:topic) do
      Topic.create( name: "Game of Thrones")
    end

    let (:user) {User.create(name: 'sam', email: 'sam@test.com', password: 'samtest@123')}
    before do
      @trivia1 = Trivia.create(title: "House Stark",
                    description: "This Trivia is related to the history and members of House Stark",
                    topic_id: topic.id,
                    author_id: user.id)

      @trivia2 = Trivia.create(title: Faker::Lorem.sentence,
                               description: Faker::Lorem.paragraph,
                               topic_id: topic.id,
                               author_id: user.id)
    end

    it 'should have many trivias' do
      expect(topic.trivias).to match_array([@trivia1, @trivia2])
    end
  end

  describe "trivias_authered_by" do
    let(:topic1) {FactoryGirl.create(:topic)}
    let(:topic2) {FactoryGirl.create(:topic)}

    let (:author1) {FactoryGirl.create(:user)}
    let (:author2) {FactoryGirl.create(:user)}

    before do
      @trivia1 = FactoryGirl.create(:trivia, topic: topic1, author: author1)
      @trivia2 = FactoryGirl.create(:trivia, topic:topic1, author: author1)
      @trivia3 = FactoryGirl.create(:trivia, topic:topic1, author: author2)
      @trivia4 = FactoryGirl.create(:trivia, topic:topic2, author: author1)
    end

    it "returns the trivias for a topic which are authored by user" do
      trivias_authored_by_user_1 = topic1.trivias_authered_by(author1)

      expect(trivias_authored_by_user_1).to match_array([@trivia1, @trivia2])
    end

    it "does not return trivias authored by other users" do
      trivias_authored_by_user_1 = topic1.trivias_authered_by(author1)

      expect(trivias_authored_by_user_1).not_to match_array([@trivia1, @trivia2, @trivia3])
    end

    it "does not return trivias for another topic" do
      trivias_authored_by_user_1 = topic1.trivias_authered_by(author1)

      expect(trivias_authored_by_user_1).not_to match_array([@trivia1, @trivia2, @trivia4])
    end
  end

  describe "players" do
    before do
      @topic_1 = FactoryGirl.create(:topic)
      @topic_2 = FactoryGirl.create(:topic)

      @trivia_1 = create_trivia(6, @topic_1)
      @trivia_2 = create_trivia(10, @topic_1)
      @trivia_3 = create_trivia(10, @topic_2)

      @player_1 = FactoryGirl.create(:user)
      @player_2 = FactoryGirl.create(:user)
      @player_3 = FactoryGirl.create(:user)
      @player_4 = FactoryGirl.create(:user)
      @player_5 = FactoryGirl.create(:user)


      @trivia_session_1 = create_trivia_session_with(3, @player_1, @trivia_1) # Score 50
      @trivia_session_2 = create_trivia_session_with(4, @player_1, @trivia_1) # Score 66
      @trivia_session_3 = create_trivia_session_with(8, @player_1, @trivia_2) # Score 80
      @trivia_session_4 = create_trivia_session_with(10, @player_2, @trivia_3) # Score 100
      @trivia_session_3 = create_trivia_session_with(8, @player_2, @trivia_1) # Score 80
      @trivia_session_4 = create_trivia_session_with(6, @player_3, @trivia_3) # Score 60
      @trivia_session_3 = create_trivia_session_with(4, @player_3, @trivia_2) # Score 40
      @trivia_session_4 = create_trivia_session_with(10, @player_4, @trivia_1) # Score 100
      @trivia_session_3 = create_trivia_session_with(8, @player_5, @trivia_2) # Score 80
      @trivia_session_4 = create_trivia_session_with(10, @player_5, @trivia_1) # Score 100
    end

    it "returns first three players in descending order of scores" do
      players_for_topic_1 = @topic_1.players

      expect(players_for_topic_1).to match_array([@player_5, @player_1, @player_2])
    end
  end
end
