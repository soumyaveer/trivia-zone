class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :password, presence: true

  has_many :trivia_sessions
  has_many :trivias, through: :trivia_sessions

  has_many :authored_trivias, foreign_key: :author_id, class_name: "Trivia"
end
