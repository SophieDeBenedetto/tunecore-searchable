### seed from spotify top 200 global tracks

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

### seed additional 100 songs from a random playlist

data = File.read('db/fixtures/seed_data_additional_songs.yml')
parsed = JSON.parse(data)

parsed["tracks"]["items"].each_with_index do |item, i|
  puts i
  Song.where(title: item["track"]["name"]).first_or_create do |s|
    album = Album.all.sample
    s.album = album
    s.artist = album.artist
  end

end

### seed additional 400 songs from another random playlist

data = File.read('db/fixtures/seed_data_additional_indie_songs.yml')
parsed = JSON.parse(data)

parsed["tracks"]["items"].each_with_index do |item, i|
  puts i
  Song.where(title: item["track"]["name"]).first_or_create do |s|
    album = Album.all.sample
    s.album = album
    s.artist = album.artist
  end

end

### seed additional 400 songs from another random playlist

data = File.read('db/fixtures/seed_data_additional_indie_songs_page_two.yml')
parsed = JSON.parse(data)

parsed["tracks"]["items"].each_with_index do |item, i|
  puts i
  Song.where(title: item["track"]["name"]).first_or_create do |s|
    album = Album.all.sample
    s.album = album
    s.artist = album.artist
  end

end

data = File.read('db/fixtures/seed_data_additional_indie_songs_page_three.yml')
parsed = JSON.parse(data)

parsed["tracks"]["items"].each_with_index do |item, i|
  puts i
  Song.where(title: item["track"]["name"]).first_or_create do |s|
    album = Album.all.sample
    s.album = album
    s.artist = album.artist
  end

end




# tracks -> items -> track[:name]