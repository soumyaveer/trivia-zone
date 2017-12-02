class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable ,
         :omniauthable, omniauth_providers: [:facebook]

  validates :name, :password, presence: true

  has_many :trivia_sessions, foreign_key: :player_id
  has_many :trivias, -> { distinct }, through: :trivia_sessions

  has_many :authored_trivias, foreign_key: :author_id, class_name: "Trivia"

  def topic_score(topic)
    trivias_in_topic = self.trivias.select { |trivia| trivia.topic == topic }

    trivias_in_topic.sum do |trivia|
      trivia.max_score_of_player(self)
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
    end
  end
end
