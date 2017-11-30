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
                    user_id: user.id)

      @trivia2 = Trivia.create(title: Faker::Lorem.sentence,
                               description: Faker::Lorem.paragraph,
                               topic_id: topic.id,
                               user_id: user.id)
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

      expect(trivias_authored_by_user_1).to match_array([@trivia1, @trivia2])
    end
  end
end
