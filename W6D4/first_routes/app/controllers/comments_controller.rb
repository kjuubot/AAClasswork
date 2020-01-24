class CommentsController < ApplicationController

  def index
    if params[:author_id]
      user = User.find(params[:author_id])
      render json: user.comments
    elsif params[:artwork_id]
      artwork = Artwork.find(params[:artwork_id])
      render json: artwork.comments
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :artwork_id, :body)
  end

end
