# Music Database - Rails Intro Project

## 1.1 Dataset Description

### Data Sources
This project integrates music data from multiple sources:

1. **MusicBrainz API** - Open music encyclopedia providing artist and album information
   - Endpoint: https://musicbrainz.org/ws/2/
   - Data: Artist names, album titles, release dates, genres

2. **CSV File** - Music chart data (Billboard/Spotify top tracks)
   - Custom CSV with popular albums and ratings
   - Data: Album rankings, popularity scores

3. **Faker Gem** - Generate realistic user reviews and ratings
   - Data: Review text, ratings, user comments

### Database Structure

**Tables Required:**

1. **artists**
   - name (string)
   - country (string)
   - formed_year (integer)
   - biography (text)

2. **albums**
   - title (string)
   - release_date (date)
   - artist_id (foreign key)
   - popularity_score (integer)

3. **genres**
   - name (string)
   - description (text)

4. **album_genres** (join table)
   - album_id (foreign key)
   - genre_id (foreign key)

5. **reviews** (Faker data)
   - album_id (foreign key)
   - reviewer_name (string)
   - rating (integer)
   - comment (text)
   - review_date (date)

### Data Relationships

- **Artist has many Albums** (one-to-many)
- **Album belongs to Artist** (one-to-many)
- **Albums and Genres** (many-to-many via album_genres)
- **Album has many Reviews** (one-to-many)

### Data Integration Strategy

1. Pull artist data from MusicBrainz API
2. Import album chart data from CSV file
3. Match albums to artists
4. Assign genres to albums (many-to-many)
5. Generate reviews using Faker gem

**Target:** 200+ total rows across all tables
- 30+ Artists
- 50+ Albums
- 10+ Genres
- 100+ Reviews
- 50+ Album-Genre associations
