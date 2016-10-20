class AddIndexTitleToSongs < ActiveRecord::Migration[5.0]
  def change
    add_index :songs, :title
  end
end
