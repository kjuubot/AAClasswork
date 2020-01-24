# == Schema Information
#
# Table name: user_collections
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserCollection < ApplicationRecord
  belongs_to :user,
    foreign_key: :user_id,
    class_name: :User
  
  has_many :collection_adds,
    foreign_key: :collection_id,
    class_name: :Collection
  
  has_many :collected_artworks,
    through: :collection_adds,
    source: :artwork
end
