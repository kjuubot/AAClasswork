# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ArtworkShare.delete_all
Artwork.delete_all
User.delete_all

users = User.create([{ username: 'Rakin' }, { username: 'Joanna'}, {username: 'Ryan' }])

artworks = Artwork.create([
  { title: 'Mona Lisa', image_url: 'mona-lisa', artist_id: users[0].id },
  { title: 'The Great Wave', image_url: 'great-wave', artist_id: users[1].id },
  { title: 'Starry Night', image_url: 'starry-night', artist_id: users[2].id },
  { title: 'Sunday Afternoon', image_url: 'sun-afternoon', artist_id: users[0].id },
  { title: 'The Scream', image_url: 'scream', artist_id: users[1].id }
  ])

ArtworkShare.create([
  { artwork_id: artworks[0].id, viewer_id: users[0].id },
  { artwork_id: artworks[1].id, viewer_id: users[2].id },
  { artwork_id: artworks[2].id, viewer_id: users[1].id },
  { artwork_id: artworks[3].id, viewer_id: users[0].id },
  { artwork_id: artworks[4].id, viewer_id: users[1].id },
  { artwork_id: artworks[1].id, viewer_id: users[2].id },
  { artwork_id: artworks[3].id, viewer_id: users[1].id },
  { artwork_id: artworks[1].id, viewer_id: users[0].id }
  ])