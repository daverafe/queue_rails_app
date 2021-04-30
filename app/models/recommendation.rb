class Recommendation < ApplicationRecord
    belongs_to :recommendation_maker, :class_name => "User"
    belongs_to :recommendation_receiver, :class_name => "User"
    belongs_to :media_asset  
    accepts_nested_attributes_for :media_asset 

    def media_asset_attributes=(media_asset_attributes)
        media_asset_attributes.values.each do |media_asset_attribute|
          media_asset = MediaAsset.find_or_create_by(media_asset_attribute)
          self.media_asset = media_asset
        end
    end 
end



