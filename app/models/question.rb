class Question < ActiveRecord::Base
  belongs_to :trivia
  has_many :answers
  accepts_nested_attributes_for :answers

  validates :description, presence: true
end
