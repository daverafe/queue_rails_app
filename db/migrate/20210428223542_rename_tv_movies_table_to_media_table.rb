class RenameTvMoviesTableToMediaTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :tv_movies, :medias
  end
end
