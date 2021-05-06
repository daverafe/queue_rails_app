class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.integer :media_asset_id
      t.integer :rating 
      t.references :recommendation_maker, references: :users, foreign_key: {to_table: :users}
      t.references :recommendation_receiver, references: :users, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
