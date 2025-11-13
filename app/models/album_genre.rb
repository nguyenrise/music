class AlbumGenre < ApplicationRecord
  belongs_to :album
  belongs_to :genre
  
  validates :album_id, presence: true, uniqueness: { scope: :genre_id }
  validates :genre_id, presence: true
end
