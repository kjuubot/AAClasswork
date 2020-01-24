# == Schema Information
#
# Table name: artworks
#
#  id          :bigint           not null, primary key
#  title       :string
#  image_url   :string
#  artist_id   :integer
#  fav_own_art :boolean          default(FALSE)
#

class Artwork < ApplicationRecord
  validates :image_url, :artist_id, presence: true
  validates :title, presence: true, uniqueness: { scope: :artist_id }

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_shares,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

  has_many :comments,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy

  has_many :likes,
    as: :likable,
    dependent: :destroy
  
  has_many :adds_to_collection,
    foreign_key: :artwork_id,
    class_name: :Collection,
    dependent: :destroy
end
