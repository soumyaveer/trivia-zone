describe TriviasController do
  describe "POST create" do
    let(:topic) { FactoryBot.create(:topic) }

    before do
      sign_in(FactoryBot.create(:user), scope: :user)
    end

    it "creates a trivia with no questions when none specified" do
      trivia_title = Faker::Lorem.sentence

      post :create, params: {
        topic_id: topic.id,
        trivia: {
          title: trivia_title
        }
      }

      expect(response.code).to eql("302")
      expect(response).to redirect_to(topic_trivias_path(topic))

      created_trivia = Trivia.find_by(title: trivia_title)
      expect(created_trivia).to be_present
      expect(created_trivia.topic).to eql(topic)
    end

    it "creates a trivia with one question" do
      trivia_title = Faker::Lorem.sentence
      question_description = Faker::Lorem.sentence
      correct_answer_description = Faker::Lorem.sentence
      incorrect_answer_description = Faker::Lorem.sentence

      post :create, params: {
        topic_id: topic.id,
        trivia: {
          title: trivia_title,
          questions_attributes: [
            {
              description: question_description,
              answers_attributes: [
                {
                  description: correct_answer_description,
                  correct: true
                },
                {
                  description: incorrect_answer_description,
                  correct: false
                }
              ]
            }
          ]
        }
      }

      expect(response.code).to eql("302")
      expect(response).to redirect_to(topic_trivias_path(topic))

      created_trivia = Trivia.find_by(title: trivia_title)
      expect(created_trivia).to be_present
      expect(created_trivia.topic).to eql(topic)

      expect(created_trivia.questions.size).to eql(1)
      question = created_trivia.questions.first
      expect(question.description).to eql(question_description)

      expect(question.answers.size).to eql(2)

      expect(question.answers.correct.size).to eql(1)
      expect(question.answers.correct.first.description).to eql(correct_answer_description)

      expect(question.answers.incorrect.size).to eql(1)
      expect(question.answers.incorrect.first.description).to eql(incorrect_answer_description)
    end
  end

  describe 'PATCH update' do
    let(:topic) { FactoryBot.create(:topic) }

    before do
      sign_in(FactoryBot.create(:user), scope: :user)
    end

    it 'edit trivia' do
      topic = FactoryBot.create(:topic)
      trivia = create_trivia(6, topic)
      updated_trivia_title = "Another title"
      question_description = Faker::Lorem.sentence
      correct_answer_description = Faker::Lorem.sentence
      incorrect_answer_description = Faker::Lorem.sentence

      patch :update, params: {
        topic_id: topic.id,
        id: trivia.id,
        trivia: {
          title: updated_trivia_title,
          questions_attributes: [
            {
              description: question_description,
              answers_attributes: [
                {
                  description: correct_answer_description,
                  correct: true
                },
                {
                  description: incorrect_answer_description,
                  correct: false
                }
              ]
            }
          ]
        }
      }

      expect(response.code).to eql("302")
      expect(response).to redirect_to(new_trivia_trivia_session_path(trivia))

      updated_trivia = Trivia.find(trivia.id)

      expect(updated_trivia.title).to eql("Another title")
    end
  end

  describe 'DELETE destroy' do
    let(:topic) { FactoryBot.create(:topic) }
    before do
      sign_in(FactoryBot.create(:user), scope: :user)
    end

    it 'should delete the trivia' do
      trivia = create_trivia(6, topic)

      expect do
        delete :destroy, params: { topic_id: topic.id, id: trivia.id }
      end.to change(Trivia, :count).by(-1)
    end
  end
end
