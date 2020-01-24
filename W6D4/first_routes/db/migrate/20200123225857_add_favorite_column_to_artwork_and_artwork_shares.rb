class AddFavoriteColumnToArtworkAndArtworkShares < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :fav_own_art, :boolean, default: false
    add_column :artwork_shares, :fav_shared_art, :boolean, default: false
  end
end
