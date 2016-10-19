class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end
  def show
    @album = Album.includes(:songs, :artist).find(params[:id])
  end
end
