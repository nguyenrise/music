class ArtistsController < ApplicationController
  def index
    @artists = Artist.order(:name).page(params[:page]).per(20)
  end

  def show
    @artist = Artist.includes(albums: :genres).find(params[:id])
  end
end
