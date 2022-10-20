# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :bigint           not null
#  viewer_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord

    # belongs_to :artwork
        # primary_key: :id,
        # foreign_key: :artwork_id,
        # class_name: :Artwork

    # belongs_to :viewer,
        # primary_key: :id,
        # foreign_key: :viewer_id,
        # class_name: :User

    belongs_to :artwork, inverse_of: :shared_artworks

    belongs_to :viewer, class_name: :User, inverse_of: :shared_viewers

end
