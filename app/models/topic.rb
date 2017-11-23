class Topic < ActiveRecord::Base
  has_many :trivias
  validates :name, presence: true, uniqueness: true

  def trivias_authered_by(user)
    self.trivias.where(author_id: user.id)
  end
end
