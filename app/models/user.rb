class User < ApplicationRecord
  has_secure_password
  has_many :received_recommendations, class_name: "Recommendation", foreign_key: "recommendation_receiver_id", dependent: :destroy
  has_many :made_recommendations, class_name: "Recommendation", foreign_key: "recommendation_maker_id", dependent: :destroy
  has_many :media_assets, through: :recommendations

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: {case_sensitive: false}
 
  def self.search(query) 
    self.where("username LIKE ?", "%#{query}%")
  end
end
