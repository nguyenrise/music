# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'
require 'httparty'
require 'faker'

puts "Clearing existing data..."
Review.destroy_all
AlbumGenre.destroy_all
Album.destroy_all
Artist.destroy_all
Genre.destroy_all

puts "Creating genres..."
genres_data = [
  { name: "Rock", description: "Rock music originated in the 1950s and has evolved into various subgenres" },
  { name: "Pop", description: "Popular music designed for mass appeal" },
  { name: "Jazz", description: "Genre characterized by swing, blue notes, and improvisation" },
  { name: "Hip Hop", description: "Music genre consisting of stylized rhythmic music and rap" },
  { name: "Electronic", description: "Music that employs electronic musical instruments and technology" },
  { name: "R&B", description: "Rhythm and blues, combining jazz, gospel, and blues" },
  { name: "Punk", description: "Fast-paced, hard-edged music with stripped-down instrumentation" },
  { name: "Alternative", description: "Non-mainstream rock music that emerged in the 1980s" },
  { name: "Classic Rock", description: "Rock music from the 1960s-1980s" },
  { name: "Indie", description: "Independent music not tied to major labels" },
  { name: "Soul", description: "Music combining R&B and gospel influences" },
  { name: "Funk", description: "Dance music with strong rhythmic groove" }
]

genres = genres_data.map { |g| Genre.create!(g) }
puts "Created #{Genre.count} genres"

# Data Source 1: CSV File
puts "\nImporting albums from CSV..."
csv_file = Rails.root.join('db', 'albums_data.csv')
csv_data = CSV.read(csv_file, headers: true)

csv_data.each do |row|
  artist = Artist.find_or_create_by!(name: row['artist_name']) do |a|
    a.country = Faker::Address.country
    a.formed_year = rand(1950..2020)
    a.biography = Faker::Lorem.paragraph(sentence_count: 3)
  end
  
  album = Album.create!(
    title: row['album_title'],
    release_date: Date.parse(row['release_date']),
    popularity_score: row['popularity_score'].to_i,
    artist: artist
  )
  
  # Assign 1-3 random genres to each album
  rand(1..3).times do
    genre = genres.sample
    AlbumGenre.create!(album: album, genre: genre) unless album.genres.include?(genre)
  end
end

puts "Created #{Artist.count} artists from CSV"
puts "Created #{Album.count} albums from CSV"

# Data Source 2: Additional artists via Faker
puts "\nGenerating additional artists with Faker..."
created_count = 0
attempts = 0
while created_count < 10 && attempts < 50
  begin
    Artist.create!(
      name: "#{Faker::Music.band} #{rand(1000..9999)}",
      country: Faker::Address.country,
      formed_year: rand(1960..2023),
      biography: Faker::Lorem.paragraph(sentence_count: 4)
    )
    created_count += 1
  rescue ActiveRecord::RecordInvalid
    attempts += 1
  end
end

puts "Total artists: #{Artist.count}"

# Data Source 3: Generate fake reviews
puts "\nGenerating reviews with Faker..."
Album.all.each do |album|
  # Each album gets 2-5 reviews
  rand(2..5).times do
    Review.create!(
      album: album,
      reviewer_name: Faker::Name.name,
      rating: rand(1..5),
      comment: Faker::Lorem.paragraph(sentence_count: rand(2..4)),
      review_date: Faker::Date.between(from: album.release_date || 1.year.ago, to: Date.today)
    )
  end
end

puts "Created #{Review.count} reviews"

puts "\n" + "="*50
puts "DATABASE SEEDING COMPLETE"
puts "="*50
puts "Artists: #{Artist.count}"
puts "Albums: #{Album.count}"
puts "Genres: #{Genre.count}"
puts "Album-Genre associations: #{AlbumGenre.count}"
puts "Reviews: #{Review.count}"
puts "Total rows: #{Artist.count + Album.count + Genre.count + AlbumGenre.count + Review.count}"
puts "="*50

