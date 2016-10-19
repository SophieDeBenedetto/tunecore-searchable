class Search

  attr_accessor :results

  def initialize(search_params)
    @album_title = search_params[:album][:term]
    @artist_name = search_params[:artist][:term]
    @song_title = search_params[:song][:term]
    @agnostic_term = search_params[:all][:term]
    @results = []
  end

  def execute
    if agnostic_term?
      execute_agnostic_search
    else
      self.results += Song.search_by_album(@album_title) if album_title?
      self.results += Song.search_by_artist(@artist_name) if artist_name?
      self.results += Song.search_by_title(@song_name) if song_title?
    end
    results.uniq
  end

  def execute_agnostic_search
    results += Song.agnostic_search(@agnostic_term)
  end

  def execute_search_by_type
  end

  def album_title?
    !@album_title.strip.empty?
  end

  def artist_name?
    !@artist_name.strip.empty?
  end

  def song_title?
    !@song_title.strip.empty?
  end

  def agnostic_term?
    !@agnostic_term.strip.empty?
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
#     },
#     all: {
#       term: 'x'
# }
#   }
# }