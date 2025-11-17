class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :country, presence: true
  validates :formed_year, numericality: { only_integer: true, greater_than: 1900, less_than_or_equal_to: 2025 }, allow_nil: true
end
