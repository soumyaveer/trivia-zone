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
    let(:topic1) {FactoryBot.create(:topic)}
    let(:topic2) {FactoryBot.create(:topic)}

    let (:author1) {FactoryBot.create(:user)}
    let (:author2) {FactoryBot.create(:user)}

    before do
      @trivia1 = FactoryBot.create(:trivia, topic: topic1, author: author1)
      @trivia2 = FactoryBot.create(:trivia, topic:topic1, author: author1)
      @trivia3 = FactoryBot.create(:trivia, topic:topic1, author: author2)
      @trivia4 = FactoryBot.create(:trivia, topic:topic2, author: author1)
    end

    it "returns the trivias for a topic which are authored by user" do
      trivias_authored_by_user_1 = topic1.trivias_authored_by(author1)

      expect(trivias_authored_by_user_1).to match_array([@trivia1, @trivia2])
    end

    it "does not return trivias authored by other users" do
      trivias_authored_by_user_1 = topic1.trivias_authored_by(author1)

      expect(trivias_authored_by_user_1).not_to match_array([@trivia1, @trivia2, @trivia3])
    end

    it "does not return trivias for another topic" do
      trivias_authored_by_user_1 = topic1.trivias_authored_by(author1)

      expect(trivias_authored_by_user_1).not_to match_array([@trivia1, @trivia2, @trivia4])
    end
  end

  describe "top_players" do
    before do
      @topic_1 = FactoryBot.create(:topic)
      @topic_2 = FactoryBot.create(:topic)

      @trivia_1 = create_trivia(6, @topic_1)
      @trivia_2 = create_trivia(10, @topic_1)
      @trivia_3 = create_trivia(10, @topic_2)

      @player_1 = FactoryBot.create(:user)
      @player_2 = FactoryBot.create(:user)
      @player_3 = FactoryBot.create(:user)
      @player_4 = FactoryBot.create(:user)
      @player_5 = FactoryBot.create(:user)


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

    it "returns first three players in descending order of total scores" do
      players_for_topic_1 = @topic_1.top_players

      expect(players_for_topic_1).to match_array([@player_5, @player_1, @player_2])
    end

    it "does not return more than three players" do
      players_for_topic_1 = @topic_1.top_players

      expect(players_for_topic_1).not_to match_array([@player_1, @player_2, @player_3, @player_4, @player_5])
    end
  end
end
