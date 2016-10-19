class SearchController < ApplicationController

  def create
    songs = Search.execute(search_params[:term])
    binding.pry
    respond_to do |f|
      f.json {render json: songs}
    end
  end

  private

    def search_params
      params.require(:search).permit(:term)
    end
end