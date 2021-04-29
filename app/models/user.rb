class User < ApplicationRecord
  has_secure_password
  has_many :recevied_recommendations, :class_name => "Recommendation"
  has_many :made_recommendations, :class_name => "Recommendation"
  has_many :media_assets, through: :recommendations

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: {case_sensitive: false}
 
  def self.search(query) 
    self.where("username LIKE ?", "%#{query}%")
  end
end
