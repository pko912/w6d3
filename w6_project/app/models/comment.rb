# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  author_id  :bigint           not null
#  artwork_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Comment < ApplicationRecord

    belongs_to :author, class_name: :User

    belongs_to :artwork

    def self.comments_for_user_id(user_id)
        Comment.where(author_id: user_id)
    end

    def self.comments_for_artwork_id(artwork_id)
        Comment.where(artwork_id: artwork_id)
    end

end
