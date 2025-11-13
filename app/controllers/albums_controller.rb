class AlbumsController < ApplicationController
  def index
    @albums = Album.includes(:artist, :genres).page(params[:page]).per(20)
  end

  def show
    @album = Album.includes(:artist, :genres, :reviews).find(params[:id])
  end
  
  def search
    if params[:query].present?
      @albums = Album.includes(:artist)
                     .where("title LIKE ? OR artists.name LIKE ?", 
                            "%#{params[:query]}%", "%#{params[:query]}%")
                     .references(:artist)
                     .page(params[:page]).per(20)
      
      # Hierarchical search by genre
      if params[:genre_id].present? && params[:genre_id] != ""
        @albums = @albums.joins(:genres).where(genres: { id: params[:genre_id] })
      end
    else
      @albums = Album.includes(:artist).page(params[:page]).per(20)
    end
    
    @genres = Genre.order(:name)
    render :index
  end
end
