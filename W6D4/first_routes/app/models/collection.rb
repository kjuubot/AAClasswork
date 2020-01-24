# == Schema Information
#
# Table name: collections
#
#  id            :bigint           not null, primary key
#  artwork_id    :integer          not null
#  collection_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Collection < ApplicationRecord
  validates :artwork_id, uniqueness: { scope: :collection_id }

  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork

  belongs_to :collection,
    foreign_key: :collection_id,
    class_name: :UserCollection
end
