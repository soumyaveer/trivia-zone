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
        current_user = FactoryGirl.create(:user)
        sign_in(:user, current_user)
      end

      it 'should render template index' do
        get :index

        expect(response).to render_template('index')
      end
    end
  end
end
