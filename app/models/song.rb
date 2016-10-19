class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :album

  def self.agnostic_search(term)
    Array.new.tap do |songs|
      songs += Song.where('title ILIKE ?', "%#{term}%")
      songs += Song.joins(:artist).where('artists.name ILIKE?', "%#{term}%")
      songs +=  Song.joins(:album).where('albums.title ILIKE?', "%#{term}%")
      return songs
    end
  end

  def self.search_by_title(term)
    Song.where('title ILIKE ?', "%#{term}%")
  end

  def self.search_by_artist(term)
    Song.joins(:artist).where('artists.name ILIKE?', "%#{term}%")
  end

  def self.search_by_album(term)
    Song.joins(:album).where('albums.title ILIKE?', "%#{term}%")
  end
end
