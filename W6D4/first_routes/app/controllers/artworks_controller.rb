class ArtworksController < ApplicationController

  def index
    user = User.find(params[:user_id])
    owned_artwork = user.artworks
    shared_artwork = user.shared_artworks
    render json: owned_artwork + shared_artwork
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find_by(id: params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  def favorite
    artwork = Artwork.find(params[:id])
    artwork.fav_own_art = true
    artwork.save

    render json: artwork
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end
