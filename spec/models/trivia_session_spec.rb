describe TriviaSession do
  describe "associations" do
    it "can have answers" do
      trivia_session = FactoryBot.create(:trivia_session)
      answer_1 = FactoryBot.create(:answer)
      answer_2 = FactoryBot.create(:answer)
      answer_3 = FactoryBot.create(:answer)

      trivia_session.answers << answer_1
      trivia_session.answers << answer_2
      trivia_session.answers << answer_3

      trivia_session.reload

      expect(trivia_session.answers).to match_array([answer_1, answer_2, answer_3])
    end
  end

  describe "score" do
    it "returns the correct answers as a percentage" do
      trivia_session = FactoryBot.create(:trivia_session)
      answer_1 = FactoryBot.create(:answer, correct: true)
      answer_2 = FactoryBot.create(:answer, correct: false)
      trivia_session.answers = [answer_1, answer_2]
      trivia_session.save!

      expect(trivia_session.score).to eql(50.00)
    end
  end
end
