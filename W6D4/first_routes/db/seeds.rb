# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Collection.delete_all
UserCollection.delete_all
Like.delete_all
Comment.delete_all
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

comments = Comment.create([
  { author_id: users[0].id, artwork_id: artworks[0].id, body: "I made this" },
  { author_id: users[2].id, artwork_id: artworks[1].id, body: "cool" },
  { author_id: users[1].id, artwork_id: artworks[1].id, body: "this sucks" },
  { author_id: users[1].id, artwork_id: artworks[2].id, body: "nice work" },
  { author_id: users[0].id, artwork_id: artworks[4].id, body: "neat" },
  { author_id: users[2].id, artwork_id: artworks[0].id, body: "not a fan" },
  { author_id: users[2].id, artwork_id: artworks[3].id, body: "who did this" },
  { author_id: users[0].id, artwork_id: artworks[3].id, body: "what is this?" },
  { author_id: users[2].id, artwork_id: artworks[1].id, body: "gross" },
  { author_id: users[0].id, artwork_id: artworks[1].id, body: "I like it" },
  { author_id: users[1].id, artwork_id: artworks[0].id, body: "sweet" },
  { author_id: users[0].id, artwork_id: artworks[2].id, body: "thsi is dope" }
])

Like.create ([
  { liker_id: users[0].id, likable_id: artworks[1].id, likable_type: "Artwork" },
  { liker_id: users[1].id, likable_id: artworks[0].id, likable_type: "Artwork" },
  { liker_id: users[2].id, likable_id: artworks[2].id, likable_type: "Artwork" },
  { liker_id: users[0].id, likable_id: artworks[4].id, likable_type: "Artwork" },
  { liker_id: users[2].id, likable_id: artworks[3].id, likable_type: "Artwork" },
  { liker_id: users[0].id, likable_id: artworks[2].id, likable_type: "Artwork" },
  { liker_id: users[1].id, likable_id: comments[1].id, likable_type: "Comment" },
  { liker_id: users[2].id, likable_id: comments[0].id, likable_type: "Comment" },
  { liker_id: users[1].id, likable_id: comments[2].id, likable_type: "Comment" },
  { liker_id: users[0].id, likable_id: comments[5].id, likable_type: "Comment" },
  { liker_id: users[0].id, likable_id: comments[8].id, likable_type: "Comment" },
  { liker_id: users[2].id, likable_id: comments[5].id, likable_type: "Comment" },
  { liker_id: users[1].id, likable_id: comments[2].id, likable_type: "Comment" },
  { liker_id: users[2].id, likable_id: comments[3].id, likable_type: "Comment" },
  { liker_id: users[0].id, likable_id: comments[1].id, likable_type: "Comment" },
  { liker_id: users[0].id, likable_id: comments[6].id, likable_type: "Comment" }
])

collections = UserCollection.create([
  { user_id: users[0].id },
  { user_id: users[1].id },
  { user_id: users[2].id },
  { user_id: users[0].id }
])

Collection.create([
  { artwork_id: artworks[1].id, collection_id: collections[0].id },
  { artwork_id: artworks[2].id, collection_id: collections[1].id },
  { artwork_id: artworks[0].id, collection_id: collections[2].id },
  { artwork_id: artworks[4].id, collection_id: collections[3].id },
  { artwork_id: artworks[3].id, collection_id: collections[2].id },
  { artwork_id: artworks[1].id, collection_id: collections[1].id },
  { artwork_id: artworks[2].id, collection_id: collections[0].id }
])