class AddMediaIdToRecommendations < ActiveRecord::Migration[6.1]
  def change
    add_column :recommendations, :media_id, :integer
  end
end
