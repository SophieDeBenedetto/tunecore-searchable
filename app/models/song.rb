class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :album

  validates :title, presence: true

  def self.agnostic_search(term)
    Array.new.tap do |songs|
      songs += Song.where('title ILIKE ?', "%#{term}%")
      songs += self.search_by_artist(term)
      songs +=  self.search_by_album(term)
      return songs
    end
  end

  def self.search_by_title(term)
    Song.where('title ILIKE ?', "%#{term}%")
  end

  def self.search_by_artist(term)
    # SELECT * FROM SONGS INNER JOIN artists ON artists.id = songs.artist_id WHERE artists.name LIKE term
    Song.joins(:artist).where('artists.name ILIKE?', "%#{term}%")
  end

  def self.search_by_album(term)
    Song.joins(:album).where('albums.title ILIKE?', "%#{term}%")
  end

  def self.search_by_title_and_artist(title, artist)
    Song.where('title ILIKE ?', "%#{title}%").joins(:artist).where('artists.name ILIKE?', "%#{artist}%")
  end

  def self.search_by_title_and_album(title, album)
    Song.where('songs.title ILIKE ?', "%#{title}%").joins(:album).where('albums.title ILIKE?', "%#{album}%")
  end

  def self.search_by_title_and_artist_and_album(title, artist, album)
    Song.where('songs.title ILIKE ?', "%#{title}%").joins(:artist).where('artists.name ILIKE?', "%#{artist}%").joins(:album).where('albums.title ILIKE?', "%#{album}%")
  end

  def self.search_by_artist_and_album(artist, album)
    Song.joins(:artist).where('artists.name ILIKE?', "%#{artist}%").joins(:album).where('albums.title ILIKE?', "%#{album}%")
  end
end
