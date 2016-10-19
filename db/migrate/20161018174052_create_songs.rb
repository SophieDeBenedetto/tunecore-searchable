class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :length
      t.references :artist, index: true
      t.references :album, index: true
      
      # add_index :vendors, :store_name, unique: true
      t.timestamps
    end
  end
end
