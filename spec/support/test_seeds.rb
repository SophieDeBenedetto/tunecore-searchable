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
