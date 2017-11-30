class Question < ActiveRecord::Base
  belongs_to :trivia
  has_many :answers
  accepts_nested_attributes_for :answers

  validates :description, presence: true
  validate :there_is_atleast_one_correct_answer
  # TODO: validate that there is atleast one correct answer specified

  def there_is_atleast_one_correct_answer
    correct_answers = self.answers.where(correct: true)
    correct_answers.count < 1 ? true : false
  end
end
