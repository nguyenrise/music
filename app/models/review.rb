class Review < ApplicationRecord
  belongs_to :album
  
  validates :album_id, presence: true
  validates :reviewer_name, presence: true
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
