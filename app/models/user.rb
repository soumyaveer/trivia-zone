class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,
         :omniauthable, :omniauth_providers => [:facebook]

  validates :name, :password, presence: true

  has_many :trivia_sessions
  has_many :trivias, through: :trivia_sessions

  has_many :authored_trivias, foreign_key: :author_id, class_name: "Trivia"

  def topic_score(topic)
    total_score = 0
    self.trivia_sessions.each do |trivia_session|
      total_score += trivia_session.score if trivia_session.trivia.topic == topic
    end
    total_score
  end

  def self.from_omniauth(auth)
    puts auth.info
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end
end
