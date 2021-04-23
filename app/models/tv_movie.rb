class TvMovie < ApplicationRecord
    has_many :recommendations
    has_many :users, through: :recommendations

    validates :title, presence: true 
end
