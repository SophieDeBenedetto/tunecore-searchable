class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :image_url
      t.references :artist, index: true
      t.timestamps
    end
  end
end
