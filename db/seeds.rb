# require 'rest-client'

# i = 1
# tracks = []
# 10.times do 
#   response = RestClient.get("http://ws.audioscrobbler.com/2.0/?method=chart.gettoptracks&api_key=#{ENV['LAST_FM_KEY']}&page=#{i}&format=json")
#   tracks << JSON.parse(response.body)["tracks"]["track"]
# end


# tracks.flatten.each do |track|
#   artist_name = track["artist"]["name"]
#   artist = Artist.where(name: artist_name).first_or_create

#   song_name = track["name"]
#   album_info = JSON.parse(RestClient.get("http://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=#{ENV['LAST_FM_KEY']}&artist=#{artist_name}&track=#{song_name}&format=json").body)
#     binding.pry
#   album_name = album_info[""]
#   Song.where(title: song_name).first_or_create do |s|
#     s.artist = artist
#   end
# end

# album_name = item["track"]["album"]["name"]
#   album = Album.where(title: album_name).first_or_create do |a|
#     a.image_url = item["track"]["album"]["images"][0]["url"]
#   end
#   song_name = item["track"]["name"]


#   song = Song.where(title: song_name).first_or_create do |s|
#     s.album = album
#   end

#   item["track"]["artists"].each do |artist|
#     artist_name = artist["name"]
#     Artist.where(name: artist_name).first_or_create do |a|
#       a.songs << song unless a.songs.include?(song)
#       a.albums << album
#     end


# {"name"=>"Heathens",
#    "duration"=>"0",
#    "playcount"=>"1138497",
#    "listeners"=>"145463",
#    "mbid"=>"",
#    "url"=>"https://www.last.fm/music/Twenty+One+Pilots/_/Heathens",
#    "streamable"=>{"#text"=>"0", "fulltrack"=>"0"},
#    "artist"=>
#     {"name"=>"Twenty One Pilots", "mbid"=>"a6c6897a-7415-4f8d-b5a5-3a5e05f3be67", "url"=>"https://www.last.fm/music/Twenty+One+Pilots"},
#    "image"=>
#     [{"#text"=>"https://lastfm-img2.akamaized.net/i/u/34s/7e78dd01402296b4b210a0ff5c27c260.png", "size"=>"small"},
#      {"#text"=>"https://lastfm-img2.akamaized.net/i/u/64s/7e78dd01402296b4b210a0ff5c27c260.png", "size"=>"medium"},
#      {"#text"=>"https://lastfm-img2.akamaized.net/i/u/174s/7e78dd01402296b4b210a0ff5c27c260.png", "size"=>"large"},
#      {"#text"=>"https://lastfm-img2.akamaized.net/i/u/300x300/7e78dd01402296b4b210a0ff5c27c260.png", "size"=>"extralarge"}]



# ### seed from spotify top 200 global tracks

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




