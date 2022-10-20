# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



User.create(username: 'biggie')
User.create(username: 'tupac')
User.create(username: 'bonnie')
User.create(username: 'bonnie2')   

Artwork.create(title: 'kyle', image_url: 'kylekyle.kyle', artist_id: 1)
Artwork.create(title: 'amin', image_url: 'cats.ilovecats', artist_id: 3)
Artwork.create(title: 'sure', image_url: 'nah.maybe', artist_id: 2)

ArtworkShare.create(artwork_id: 1, viewer_id: 1)
ArtworkShare.create(artwork_id: 1, viewer_id: 4)
ArtworkShare.create(artwork_id: 2, viewer_id: 1)
