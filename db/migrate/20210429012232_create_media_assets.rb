class CreateMediaAssets < ActiveRecord::Migration[6.1]
  def change
    create_table :media_assets do |t|
      t.string :title
      t.string :media_type

      t.timestamps
    end
  end
end
