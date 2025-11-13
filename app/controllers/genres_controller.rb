class GenresController < ApplicationController
  def index
    @genres = Genre.order(:name).page(params[:page]).per(20)
  end

  def show
    @genre = Genre.includes(albums: :artist).find(params[:id])
    @albums = @genre.albums.page(params[:page]).per(20)
  end
end
