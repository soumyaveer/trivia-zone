describe TriviaZoneController do
  describe 'GET index' do
    context 'when user is not logged in' do
      it 'redirects to login page' do
        get :index

        expect(response).to redirect_to(new_user_session_url)
      end
    end

    context 'when the user is logged in' do
      before do
        @current_user = FactoryGirl.create(:user)
        @another_user = FactoryGirl.create(:user)
        sign_in(:user, @current_user)
      end

      it 'should render template index' do
        get :index

        expect(response).to render_template('index')
      end

      it 'returns all the played trivias for the current user' do
        topic_1 = FactoryGirl.create(:topic)
        topic_2 = FactoryGirl.create(:topic)
        trivia_1 = create_trivia(6, topic_1)
        trivia_2 = create_trivia(10, topic_1)
        trivia_3 = create_trivia(10, topic_2)

        trivia_session1 = create_trivia_session_with(3, @current_user, trivia_1) # Score 50
        trivia_session2 = create_trivia_session_with(4, @current_user, trivia_1) # Score 66
        trivia_session3 = create_trivia_session_with(8, @current_user, trivia_2) # Score 80
        trivia_session4 = create_trivia_session_with(10, @current_user, trivia_3) # Score 100

        get :index
        expect(assigns(:trivia_sessions)).to match_array([trivia_session1,
                                                          trivia_session2,
                                                          trivia_session3,
                                                          trivia_session4])
      end

      it 'should not return the trivias played by any other user' do
        topic_1 = FactoryGirl.create(:topic)
        topic_2 = FactoryGirl.create(:topic)
        trivia_1 = create_trivia(6, topic_1)
        trivia_2 = create_trivia(10, topic_1)
        trivia_3 = create_trivia(10, topic_2)

        trivia_session1 = create_trivia_session_with(3, @current_user, trivia_1) # Score 50
        trivia_session2 = create_trivia_session_with(4, @another_user, trivia_1) # Score 66
        trivia_session3 = create_trivia_session_with(8, @another_user, trivia_2) # Score 80
        trivia_session4 = create_trivia_session_with(10, @current_user, trivia_3) # Score 100

        get :index

        expect(assigns(:trivia_sessions)).to match_array([trivia_session1,
                                                          trivia_session4])

        expect(assigns("trivia_sessions")).not_to match_array([trivia_session2,
                                                               trivia_session3])
      end
    end
  end
end
