json.array! @songs do |song|
  json.(song, :id, :title)
  json.artist do 
    song.artist.nil? ? json.name(' ') : json.name(song.artist.name)
  end

  json.album do 
    json.title(song.album.title)
  end
end
