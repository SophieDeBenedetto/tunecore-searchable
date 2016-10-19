class SongsController < ApplicationController

  def index
    @songs = Song.all
  end
  def show
    @song = Song.includes(:artist, :album).find(params[:id])
  end
end
