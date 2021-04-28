class RemoveTitleFromRecommendations < ActiveRecord::Migration[6.1]
  def change
    remove_column :recommendations, :title 
  end
end
