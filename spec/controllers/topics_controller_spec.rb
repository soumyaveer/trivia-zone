describe TopicsController do
  describe 'GET index' do
    context 'when user in not logged in' do
      it 'redirects to login page' do
        get :index

        expect(response).to redirect_to(new_user_session_url)
      end
    end

    context 'when user is logged in' do
      before do
        @current_user = FactoryBot.create(:user)
        @another_user = FactoryBot.create(:user)
        sign_in(@current_user, scope: :user)
      end

      context 'when format is HTML' do

        it 'should render template index' do
          get :index

          expect(response).to render_template('index')
        end

        it 'returns all the topics' do
          topic_1 = FactoryBot.create(:topic)
          topic_2 = FactoryBot.create(:topic)
          topic_3 = FactoryBot.create(:topic)

          get :index

          expect(assigns("topics")).to match_array([topic_1, topic_2, topic_3])
        end
      end

      context 'when format is JSON' do
        it 'renders template index' do
          get :index, format: :json

          expect(response.code).to eql("200")
        end

        it 'returns the topics in JSON format' do
          topic_1 = FactoryBot.create(:topic)
          topic_2 = FactoryBot.create(:topic)
          topic_3 = FactoryBot.create(:topic)

          get :index, format: :json

          json_response = JSON.parse(response.body).deep_symbolize_keys
          expect(json_response[:topics]).to eql([{id: topic_1.id , name: topic_1.name, trivias: []},
                                                 {id: topic_2.id , name: topic_2.name, trivias: []},
                                                 {id: topic_3.id , name: topic_3.name, trivias: []}]);
        end
      end
    end
  end

  describe 'POST create' do
    before do
      @current_user = FactoryBot.create(:user)
      sign_in(@current_user, scope: :user)
    end

    it 'creates a new topic' do
      post :create, params: { topic: { name: 'topic-name' } }

      topic_1 = Topic.find_by(name: 'topic-name')
      expect(topic_1.present?).to eql(true)
    end
  end

  describe "GET show" do
    context 'when user is not logged in' do
      it 'redirects to login page' do
        topic = FactoryBot.create(:topic)
        get :show, params: {id: topic}

        expect(response).to redirect_to(new_user_session_url)
      end
    end

    context 'when the user is logged in' do
      before do
        @current_user = FactoryBot.create(:user)
        sign_in(@current_user, scope: :user)
      end

      context 'when format is HTML' do
        it 'should render template index' do
          topic = FactoryBot.create(:topic)

          get :show, params: { id: topic }

          expect(response).to render_template('show')
        end

        it 'returns all the played trivias for the topic' do
          topic_1 = FactoryBot.create(:topic)
          topic_2 = FactoryBot.create(:topic)
          trivia_1 = create_trivia(6, topic_1)
          trivia_2 = create_trivia(10, topic_1)
          create_trivia(10, topic_2)

          get :show, params: { id: topic_1 }

          expect(assigns(:trivias)).to match_array([trivia_1, trivia_2])
        end

        it 'should not return the trivias of another topic' do
          topic_1 = FactoryBot.create(:topic)
          topic_2 = FactoryBot.create(:topic)
          trivia_1 = create_trivia(6, topic_1)
          trivia_2 = create_trivia(10, topic_1)
          trivia_3 = create_trivia(10, topic_2)

          get :show, params: { id: topic_1 }

          expect(assigns(:trivias)).not_to match_array([trivia_1, trivia_2, trivia_3])
        end
      end

      context 'when format is JSON' do
        it 'response should be 200' do
          topic = FactoryBot.create(:topic)

          get :show, params: { id: topic }, format: :json

          expect(response.code).to eql("200")
        end

        it 'returns all the played trivias for the topic in JSON format' do
          topic_1 = FactoryBot.create(:topic)
          topic_2 = FactoryBot.create(:topic)
          trivia_1 = FactoryBot.create(:trivia, topic: topic_1)
          trivia_2 = FactoryBot.create(:trivia, topic: topic_1)
          FactoryBot.create(:trivia, topic: topic_2)

          get :show, params: { id: topic_1 }, format: :json

          json_response = JSON.parse(response.body).deep_symbolize_keys

          expect(json_response[:topic][:id]).to eql(topic_1.id)
          expect(json_response[:topic][:name]).to eql(topic_1.name)
          expect(json_response[:topic][:trivias][0][:id]).to eql(trivia_1.id)
          expect(json_response[:topic][:trivias][1][:id]).to eql(trivia_2.id)
          expect(json_response[:topic][:trivias][0][:title]).to eql(trivia_1.title)
          expect(json_response[:topic][:trivias][1][:title]).to eql(trivia_2.title)
        end
      end
    end
  end
end
