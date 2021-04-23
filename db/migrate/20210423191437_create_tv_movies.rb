class CreateTvMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :tv_movies do |t|
      t.string :title
      t.string :content_type

      t.timestamps
    end
  end
end
