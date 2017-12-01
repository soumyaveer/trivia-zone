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
        @current_user = FactoryGirl.create(:user)
        @another_user = FactoryGirl.create(:user)
        sign_in(:user, @current_user)

      end

      it 'should render template index' do
        get :index

        expect(response).to render_template('index')
      end

      it 'returns all the topics' do
        topic1 = FactoryGirl.create(:topic)
        topic2 = FactoryGirl.create(:topic)
        topic3 = FactoryGirl.create(:topic)

        get :index

        expect(assigns("topics")).to match_array([topic1, topic2, topic3])
      end
    end
  end

  describe 'POST create' do
    before do
      @current_user = FactoryGirl.create(:user)
      sign_in(:user, @current_user)
    end

    it 'creates a new topic' do
      post :create, params: {topic: {name: 'topic-name' }}

      topic1 = Topic.find_by(name: 'topic-name')
      expect(topic1.present?).to eql(true)
    end
  end
end
