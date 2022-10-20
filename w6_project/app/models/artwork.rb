# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, :image_url, presence: true
    validates :title, uniqueness: { scope: :artist_id, message: "User already owns artwork"}

    # belongs_to :artist, 
        # primary_key: :id,
        # foreign_key: :artist_id,
        # class_name: :User
        
    # has_many :artwork_shares,
        # primary_key: :id,
        # foreign_key: :artwork_id,
        # class_name: :ArtworkShare,
        # dependent: :destroy,
        # inverse_of: :artwork
        
    belongs_to :artist, class_name: :User

    has_many :artwork_shares, dependent: :destroy, inverse_of: :artwork

    has_many :comments, dependent: :destroy, inverse_of: :artwork

    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    def self.artworks_for_user_id(user_id)
        artworks = Artwork.joins(:artist).where(artist_id: user_id)
        artworks += Artwork.joins(:shared_viewers).where('users.id = ?', user_id)
        artworks
    end

end
