class ChangeMediaId < ActiveRecord::Migration[6.1]
  def change
    rename_column :recommendations, :media_id, :media_asset_id
  end
end
