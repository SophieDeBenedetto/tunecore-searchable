class AddIndexNameToArtists < ActiveRecord::Migration[5.0]
  def change
    add_index :artists, :name
  end
end
