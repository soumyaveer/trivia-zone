class Topic < ActiveRecord::Base
  has_many :trivias
  validates :name, presence: true, uniqueness: true
end
