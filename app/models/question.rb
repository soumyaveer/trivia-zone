class Question < ApplicationRecord
  belongs_to :trivia
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :description, presence: true
end
