class MediaAsset < ApplicationRecord
    has_many :recommendations
    has_many :users, through: :recommendations

    validates :title, presence: true 
    validates :title, uniqueness: {case_sensitive: false}


    def self.search(query) 
        self.where("title LIKE ?", "%#{query}%")
    end
end
