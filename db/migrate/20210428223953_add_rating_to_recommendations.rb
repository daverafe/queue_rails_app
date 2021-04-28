class AddRatingToRecommendations < ActiveRecord::Migration[6.1]
  def change
    add_column :recommendations, :rating, :integer
  end
end
