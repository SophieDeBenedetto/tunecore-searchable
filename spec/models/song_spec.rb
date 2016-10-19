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

  context "search methods" do 
    before(:all) do 
      @sorry1 = Song.find_by(title: "Sorry", artist: Artist.find_by(name: "Beyonce"))
      @hold_up = Song.find_by(title: "Hold Up")
      @all_night = Song.find_by(title: "All Night")

      @sorry2 = Song.find_by(title: "Sorry", artist: Artist.find_by(name: "Justin Beiber"))
      @love_yourself = Song.find_by(title: "Love Yourself")
      @company = Song.find_by(title: "Company")

      @hello = Song.find_by(title: "Hello")
      @love = Song.find_by(title: "Love")
      @hold_you = Song.find_by(title: "Hold You")

    end

    describe '.search_by_title' do 
      it 'returns all the songs with a title like the given title' do 
        expect(Song.search_by_title('sorry')).to match_array([@sorry1, @sorry2])
      end
    end

    describe '.search_by_title_and_artist' do 
      it 'returns all the songs with a title like the given title by the artist with name like the given artist name' do 
        expect(Song.search_by_title_and_artist('sorry', 'justin')).to match_array([@sorry2])
      end
    end

    describe '.search_by_title_and_album' do 
      it 'returns all songs with title like the given title and album with name like the given album name' do 
        expect(Song.search_by_title_and_album('sorry', 'lemonade')).to match_array([@sorry1])
      end
    end

    describe '.search_by_title_and_artist_and_album' do 
      it 'returns all of the songs with title like the given title, belonging to artist with name like given artist name, belonging to album with title like given album title' do 
        expect(Song.search_by_title_and_artist_and_album('all night', 'beyonce', 'lemonade')).to match_array(@all_night)
      end
    end


    describe '.search_by_artist_and_album' do 
      it 'returns all songs by artist with name like given artist name, belonging to album with name like given album name' do 
        expect(Song.search_by_artist_and_album('adele', 'hello')).to match_array([@hello, @love, @hold_you])
      end
    end
  end
end
