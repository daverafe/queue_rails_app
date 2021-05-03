class Recommendation < ApplicationRecord
    belongs_to :recommendation_maker, class_name: "User"
    belongs_to :recommendation_receiver, class_name: "User"
    belongs_to :media_asset  
    accepts_nested_attributes_for :media_asset, reject_if: :all_blank 


    def self.most_recent
      self.order(created_at: :desc)
    end
end



