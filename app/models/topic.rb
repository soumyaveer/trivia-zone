class Topic < ActiveRecord::Base
  has_many :trivias
  validates :name, presence: true
  validates :name, uniqueness: true
end
