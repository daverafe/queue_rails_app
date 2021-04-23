class User < ApplicationRecord
  has_secure_password
  has_many :recommendations
  has_many :tv_movies, through: :recommendations

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: {case_sensitive: false}
 
end
