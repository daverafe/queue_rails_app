class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.integer :user_id
      t.integer :media_id

      t.timestamps
    end
  end
end
