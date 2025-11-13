# Database ERD - Music Database

```
┌─────────────────────┐
│      artists        │
├─────────────────────┤
│ id (PK)             │
│ name                │
│ country             │
│ formed_year         │
│ biography           │
│ created_at          │
│ updated_at          │
└─────────────────────┘
          │
          │ 1:N
          │
          ▼
┌─────────────────────┐
│      albums         │
├─────────────────────┤
│ id (PK)             │
│ title               │
│ release_date        │
│ artist_id (FK)      │
│ popularity_score    │
│ created_at          │
│ updated_at          │
└─────────────────────┘
          │                  ┌─────────────────────┐
          │ 1:N              │      genres         │
          │                  ├─────────────────────┤
          ▼                  │ id (PK)             │
┌─────────────────────┐      │ name                │
│      reviews        │      │ description         │
├─────────────────────┤      │ created_at          │
│ id (PK)             │      │ updated_at          │
│ album_id (FK)       │      └─────────────────────┘
│ reviewer_name       │                ▲
│ rating              │                │
│ comment             │                │ N:M
│ review_date         │                │
│ created_at          │      ┌─────────────────────┐
│ updated_at          │      │   album_genres      │
└─────────────────────┘      ├─────────────────────┤
                             │ id (PK)             │
                             │ album_id (FK)       │
                             │ genre_id (FK)       │
                             │ created_at          │
                             │ updated_at          │
                             └─────────────────────┘
                                       │
                                       │ N:M
                                       │
                             (connects to albums)
```

## Relationships

### One-to-Many Associations
- Artist → Albums (1:N)
- Album → Reviews (1:N)

### Many-to-Many Association
- Albums ↔ Genres (N:M via album_genres join table)

## Validations (to be implemented)

### Artist
- name: presence, uniqueness
- country: presence
- formed_year: numericality (optional)

### Album
- title: presence
- artist_id: presence
- popularity_score: numericality (0-100)

### Genre
- name: presence, uniqueness

### Review
- album_id: presence
- rating: presence, numericality (1-5)
- reviewer_name: presence

### AlbumGenre
- album_id: presence, uniqueness with genre_id
- genre_id: presence
