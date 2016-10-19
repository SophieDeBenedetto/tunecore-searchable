data = File.read('db/fixtures/seed_data.yml')
parsed = JSON.parse(data)
parsed["entries"]["items"].each do |item|
  album_name = item["track"]["album"]["name"]
  album = Album.where(title: album_name).first_or_create do |a|
    a.image_url = item["track"]["album"]["images"][0]["url"]
  end
  song_name = item["track"]["name"]


  song = Song.where(title: song_name).first_or_create do |s|
    s.album = album
  end

  item["track"]["artists"].each do |artist|
    artist_name = artist["name"]
    Artist.where(name: artist_name).first_or_create do |a|
      a.songs << song unless a.songs.include?(song)
      a.albums << album
    end
  end
end
