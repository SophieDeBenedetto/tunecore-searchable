class AddIndexTitleToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_index :albums, :title
  end
end
