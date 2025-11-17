class Album < ApplicationRecord
  belongs_to :artist
  has_many :reviews, dependent: :destroy
  has_many :album_genres, dependent: :destroy
  has_many :genres, through: :album_genres

  validates :title, presence: true
  validates :artist_id, presence: true
  validates :popularity_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, allow_nil: true

  scope :popular, -> { where("popularity_score >= ?", 80).order(popularity_score: :desc) }
  scope :recent, -> { order(release_date: :desc) }
  scope :by_genre, ->(genre_id) { joins(:genres).where(genres: { id: genre_id }) }

  def average_rating
    reviews.average(:rating)&.round(1) || 0
  end
end
