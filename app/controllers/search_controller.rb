class SearchController < ApplicationController

  def create
    @songs = Search.new(search_params).execute
    respond_to do |f|
      f.js
    end
  end

  private

    def search_params
      params.require(:search).permit(all: [:term], artist: [:term], song: [:term], album: [:term])
    end
end