describe TriviaSessionsController do
  describe "POST create" do
    let(:current_user) { FactoryGirl.create(:user) }

    before { sign_in(:user, current_user) }

    it "creates a trivia session with selected answers" do
      trivia = FactoryGirl.create(:trivia)

      question_1 = FactoryGirl.create(:question, trivia: trivia)
      answer_1_for_question_1 = FactoryGirl.create(:answer, question: question_1)
      answer_2_for_question_1 = FactoryGirl.create(:answer, question: question_1, correct: true)

      question_2 = FactoryGirl.create(:question, trivia: trivia)
      answer_1_for_question_2 = FactoryGirl.create(:answer, question: question_2, correct: true)
      answer_2_for_question_2 = FactoryGirl.create(:answer, question: question_2)

      expect(trivia.trivia_sessions).to be_blank

      post :create, params: {
        trivia_id: trivia.id,
        trivia_session: {
          question: {
            question_1.id => {
              answer_id: answer_1_for_question_1.id
            },
            question_2.id => {
              answer_id: answer_1_for_question_2.id
            }
          }
        }
      }

      expect(response.code).to eql("200")
      trivia.reload

      expect(trivia.trivia_sessions.size).to eql(1)
      created_trivia_session = trivia.trivia_sessions[0]
      expect(created_trivia_session.user).to eql(current_user)

      expect(created_trivia_session.answers)
        .to match_array([answer_1_for_question_1, answer_2_for_question_2])
    end
  end
end
