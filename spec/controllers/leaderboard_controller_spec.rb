describe LeaderboardsController do
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
        sign_in(:user, @current_user)
      end

      it 'should render template index' do
        get :index

        expect(response).to render_template('index')
      end

      it 'returns all the topics' do
        topic_1 = FactoryGirl.create(:topic)
        topic_2 = FactoryGirl.create(:topic)
        trivia_1 = create_trivia(6, topic_1)
        trivia_2 = create_trivia(10, topic_1)
        trivia_3 = create_trivia(10, topic_2)

        player = FactoryGirl.create(:user)
        create_trivia_session_with(3, player, trivia_1)
        create_trivia_session_with(4, player, trivia_1)
        create_trivia_session_with(8, player, trivia_2)
        create_trivia_session_with(10, player, trivia_3)

        get :index

        expect(assigns(:topics)).to match_array([topic_1, topic_2])
      end
    end
  end

end
