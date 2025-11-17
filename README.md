# Music Database - Rails Intro Project

A comprehensive Ruby on Rails application for browsing and searching music albums, artists, and genres with integrated data from multiple sources.

## Features

### Core Functionality
- ✅ Browse albums, artists, and genres with pagination
- ✅ Search albums by title or artist name
- ✅ Filter albums by genre (hierarchical search)
- ✅ View detailed album information with reviews and ratings
- ✅ Navigate between related entities (artists → albums → genres)
- ✅ Responsive Bootstrap 5 design with grid layout
- ✅ Valid HTML5 markup

### Database
- **391+ total records** from 3 data sources:
  - 50+ Albums from CSV file
  - 59+ Artists (CSV + Faker)
  - 12 Genres
  - 181+ Reviews (Faker)
  - 89+ Album-Genre associations

### Data Relationships
- **One-to-Many:** Artists → Albums
- **One-to-Many:** Albums → Reviews  
- **Many-to-Many:** Albums ↔ Genres

## Project Requirements Met

### Features Implemented
- ✅ 1.1 - Dataset description
- ✅ 1.2 - Database ERD
- ✅ 1.3 - AR Models (3 tables)
- ✅ 1.4 - Model associations (1 one-to-many)
- ✅ 1.5 - Multiple associations (2 many-to-many)
- ✅ 1.6 - Validations on all models
- ✅ 1.7 - Data from 3 sources (CSV, Faker x2)
- ✅ 2.1 - About page
- ✅ 2.2 - Navigation menu
- ✅ 3.1 - Collection navigation
- ✅ 3.2 - Member pages
- ✅ 3.3 - Multi-model data on member pages
- ✅ 3.4 - Hierarchical navigation
- ✅ 3.5 - Pagination (Kaminari)
- ✅ 4.1 - Simple search
- ✅ 4.2 - Hierarchical search (by genre)
- ✅ 5.1 - Valid HTML5
- ✅ 5.2 - ERB conditionals
- ✅ 5.3 - Bootstrap grid layout
- ✅ 6.1 - Git and GitHub
- ✅ 6.2 - 20+ Git commits

## Setup Instructions

### Prerequisites
- Ruby 3.2.2
- Rails 8.0.3
- SQLite3

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd music
```

2. Install dependencies:
```bash
bundle install
```

3. Create and setup the database:
```bash
rails db:create
rails db:migrate
rails db:seed
```

4. Start the Rails server:
```bash
rails server
```

5. Visit http://localhost:3000 in your browser

## Database Schema

See `ERD.md` for complete database structure and relationships.

## Data Sources

1. **CSV File** - `db/albums_data.csv` with 50 classic albums
2. **Faker Gem** - Additional artist profiles and biographies
3. **Faker Gem** - 180+ user reviews with ratings

See `PROJECT_PLAN.md` for detailed data source descriptions.

## Technologies Used

- **Framework:** Ruby on Rails 8.0.3
- **Database:** SQLite3
- **Frontend:** Bootstrap 5.3.2, HTML5, CSS3
- **Pagination:** Kaminari gem
- **Data Generation:** Faker gem
- **Version Control:** Git

## Project Structure

```
app/
├── controllers/     # Album, Artist, Genre, Pages controllers
├── models/         # ActiveRecord models with associations
├── views/          # ERB templates with Bootstrap layout
└── assets/         # CSS stylesheets

db/
├── migrate/        # Database migrations
├── seeds.rb        # Data import script
└── albums_data.csv # CSV data source

config/
└── routes.rb       # Application routes
```

## Author

Created as part of the Rails Intro Project assignment.

## License

This project is created for educational purposes.
