class ChangeRecommendationRecevierIdName < ActiveRecord::Migration[6.1]
  def change
    rename_column :recommendations, :recommendation_recevier_id, :recommendation_receiver_id
  end
end
