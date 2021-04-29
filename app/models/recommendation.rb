class Recommendation < ApplicationRecord
    belongs_to :recommendation_maker, :class_name => "User"
    belongs_to :recommendation_receiver, :class_name => "User"
    belongs_to :media_asset  
end



