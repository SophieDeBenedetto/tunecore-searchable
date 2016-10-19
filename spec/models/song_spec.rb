require 'rails_helper'

describe Song do

  context 'validations' do 
    it 'is valid with a title' do 
      song = Song.new(title: '7/11', artist: Artist.first, album: Album.first)
      expect(song).to be_valid
    end

     it 'is invalid with a title' do 
      song = Song.new(artist: Artist.first, album: Album.first)
      expect(song).to_not be_valid
    end
  end
  
  context 'associations' do 
    it "belongs to an artist" do
      expect(Song.reflect_on_association(:artist).macro).to eq :belongs_to
      expect(Song.column_names).to include "artist_id"
    end

    it "belongs to an album" do
      expect(Song.reflect_on_association(:album).macro).to eq :belongs_to
      expect(Song.column_names).to include "album_id"
    end
  end
end
