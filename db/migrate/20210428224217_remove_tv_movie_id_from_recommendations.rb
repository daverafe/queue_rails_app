class RemoveTvMovieIdFromRecommendations < ActiveRecord::Migration[6.1]
  def change
    remove_column :recommendations, :tv_movie_id
  end
end
