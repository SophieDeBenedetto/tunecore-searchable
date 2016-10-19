class Search

  attr_accessor :results

  def initialize(search_params)
    @album_title = search_params[:album][:term]
    @artist_name = search_params[:artist][:term]
    @song_title = search_params[:song][:term]
    @results = []
  end

  def execute
    results += Song.search_by_album(@album_title) if album_name?
    results += Song.search_by_artist(@artist_name) if artist_name?
    results += Song.search_by_title(@song_name) if song_title?
  end

  def album_title?
    @album_title.strip.empty?
  end

  def artist_name?
    @artist_name.strip.empty?
  end

  def song_title?
    @song_title.strip.empty?
  end
end


# params => 
# {search: 
#   {
#     album: {
#       term: 'x'
#     },
#     song: {
#       term: 'x'
#     },
#     artist: {
#       term: 'x'
#     }
#   }
# }