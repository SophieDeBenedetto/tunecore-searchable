# data = File.read('db/fixtures/seed_data.yml')
# parsed = JSON.parse(data)
# parsed["entries"]["items"].each do |item|
#   album_name = item["track"]["album"]["name"]
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
#   end
# end

adele = Artist.create(name: "Adele")
justin = Artist.create(name: "Justin Beiber")
beyonce = Artist.create(name: "Beyonce")

hello = Album.create(title: 'Hello', artist: adele)
purpose = Album.create(title: 'Purpose', artist: justin)
lemondade = Album.create(title: 'Lemonade', artist: beyonce)


Song.create(title: "Sorry", album: lemondade, artist: beyonce)
Song.create(title: "Hold Up", album: lemondade, artist: beyonce)
Song.create(title: "All Night", album: lemondade, artist: beyonce)

Song.create(title: "Sorry", album: purpose, artist: justin)
Song.create(title: "Love Yourself", album: purpose, artist: justin)
Song.create(title: "Company", album: purpose, artist: justin)

Song.create(title: "Hello", album: hello, artist: adele)
Song.create(title: "Love", album: hello, artist: adele)
Song.create(title: "Hold You", album: hello, artist: adele)
