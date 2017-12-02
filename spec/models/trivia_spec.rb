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

    it 'has_many questions' do
      expect(trivia.questions).to match_array([@question1, @question2, @question3])
    end

    it 'belongs to topic' do
      expect(trivia.topic).to eql(topic)
    end

    it 'is created by an author' do
      expect(trivia.author).to eql(author)
    end
  end

  describe "max_score_of_user" do
    it "returns the max score of the user in trivia" do
      topic = FactoryBot.create(:topic)
      # setup trivia
      trivia = create_trivia(2, topic)
      player = FactoryBot.create(:user)

      # setup with a score of 50
      create_trivia_session_with(1, player, trivia)

      # setup with a score of 100
      create_trivia_session_with(2, player, trivia)

      expect(trivia.max_score_of_player(player)).to eql(100.00)
    end

    it "returns 0 if user has not played trivia" do
      topic = FactoryBot.create(:topic)
      trivia = create_trivia(2, topic)
      player = FactoryBot.create(:user)

      expect(trivia.max_score_of_player(player)).to eql(0)
    end
  end

  describe "search" do
    let(:topic) { Topic.create(name: Faker::Lorem.word)}
    let (:author) { User.create(name: 'sam', email: 'sam@test.com', password: 'samtest@123') }

    let(:trivia_1) do
      Trivia.create(title: "House Stark",
                    description: "This Trivia is related to the history and members of Warden of the North",
                    topic: topic,
                    author: author)
    end

    let(:trivia_2) do
      Trivia.create(title: "Rob and Siblings",
                    description: "This Trivia is related to the history and siblings of Rob Stark",
                    topic: topic,
                    author: author)
    end


    let(:trivia_3) do
      Trivia.create(title: "Star Wars",
                    description: "The Jedi Trivia",
                    topic: topic,
                    author: author)
    end

    it "returns the trivia matching the searched string" do
      searched_string = "Stark"

      searched_trivias = Trivia.search(searched_string)

      expect(searched_trivias).to match_array([trivia_1, trivia_2])
    end

    it "does not return the trivia that does not match the searched string" do
      searched_string = "Stark"

      searched_trivias = Trivia.search(searched_string)

      expect(searched_trivias).not_to match_array([trivia_1, trivia_2, trivia_3])
    end
  end
end
