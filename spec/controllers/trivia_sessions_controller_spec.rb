describe TriviaSessionsController do
  describe "POST create" do
    let(:current_user) { FactoryBot.create(:user) }

    before { sign_in(current_user, scope: :user) }

    it "creates a trivia session with selected answers" do
      trivia = FactoryBot.create(:trivia)

      question_1 = FactoryBot.create(:question, trivia: trivia)
      answer_1_for_question_1 = FactoryBot.create(:answer, question: question_1)
      answer_2_for_question_1 = FactoryBot.create(:answer, question: question_1, correct: true)

      question_2 = FactoryBot.create(:question, trivia: trivia)
      answer_1_for_question_2 = FactoryBot.create(:answer, question: question_2, correct: true)
      answer_2_for_question_2 = FactoryBot.create(:answer, question: question_2)

      expect(trivia.trivia_sessions).to be_blank

      post :create, params: {
        trivia_id: trivia.id,
        trivia_session: {
          question: {
            question_1.id => {
              answer_id: answer_1_for_question_1.id
            },
            question_2.id => {
              answer_id: answer_2_for_question_2.id
            }
          }
        }
      }

      trivia.reload

      expect(trivia.trivia_sessions.size).to eql(1)
      created_trivia_session = trivia.trivia_sessions[0]
      expect(created_trivia_session.player).to eql(current_user)

      expect(created_trivia_session.answers)
        .to match_array([answer_1_for_question_1, answer_2_for_question_2])

      expect(response)
        .to redirect_to(trivia_trivia_session_path(created_trivia_session.trivia, created_trivia_session.trivia))
    end
  end

  describe 'GET show' do
    let(:current_user) { FactoryBot.create(:user) }
    before { sign_in(current_user, scope: :user) }

    context "when format is HTML" do
      it 'returns the trivia session score' do
        topic = FactoryBot.create(:topic)
        trivia = create_trivia(10, topic)
        trivia_session = create_trivia_session_with(4, current_user, trivia) # score 66

        get :show, params: { id: trivia_session.id }

        expect(assigns(:trivia_session)).to eql(trivia_session)
        expect(response).to render_template('show')
      end
    end

    context "when format is JSON" do
      it "returns the specified trivia session along with previous and next trivia session ids as 'meta'" do
        topic = FactoryBot.create(:topic)
        trivia = FactoryBot.create(:trivia, topic: topic)

        trivia_session_1 = FactoryBot.create(:trivia_session, trivia: trivia, player: current_user, created_at: 3.days.ago)
        trivia_session_2 = FactoryBot.create(:trivia_session, trivia: trivia, player: current_user, created_at: 2.days.ago)
        trivia_session_3 = FactoryBot.create(:trivia_session, trivia: trivia, player: current_user, created_at: 1.day.ago)

        get :show, params: { id: trivia_session_2.id }, format: :json

        expect(response.code).to eql("200")
        json_response = JSON.parse(response.body).deep_symbolize_keys

        expect(json_response[:trivia_session][:id]).to eql(trivia_session_2.id)
        expect(json_response[:trivia_session][:feedback]).to eql(trivia_session_2.feedback)
        expect(json_response[:trivia_session][:score]).to eql(trivia_session_2.score)
        expect(json_response[:trivia_session][:trivia][:id]).to eql(trivia.id)
        expect(json_response[:trivia_session][:trivia][:title]).to eql(trivia.title)
        expect(json_response[:trivia_session][:meta][:previous]).to eql(trivia_session_1.id)
        expect(json_response[:trivia_session][:meta][:next]).to eql(trivia_session_3.id)
      end
    end
  end

  describe 'DELETE destroy' do
    let(:current_user) { FactoryBot.create(:user) }

    before { sign_in(current_user, scope: :user) }

    it 'should delete the trivia session' do
      topic = FactoryBot.create(:topic)
      trivia = create_trivia(10, topic)
      trivia_session_1 = create_trivia_session_with(4, current_user, trivia) # score 66
      trivia_session_2 = create_trivia_session_with(10, current_user, trivia) # score 100
      expect do
        delete :destroy, params: { trivia_id: trivia.id, id: trivia_session_1.id}
        end.to change(TriviaSession, :count).by(-1)

      expect(assigns(:trivia_sessions)).not_to match_array([trivia_session_1, trivia_session_2])
    end
  end
end
