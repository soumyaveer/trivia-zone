class Answer < ActiveRecord::Base
  belongs_to :question

  validates :description, presence: true
  validates :correct, presence: true
end
