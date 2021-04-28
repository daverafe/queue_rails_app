class ChangeContentTypeColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :medias, :content_type, :media_type 
  end
end
