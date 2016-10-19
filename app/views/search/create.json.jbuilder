json.array! @songs do |song|
  json.(song, :id, :title)
  json.artist do 
    song.artist.nil? ? nil : json.name(song.artist.name)
  end

  json.album do 
    json.name(song.album.title)
  end
end
