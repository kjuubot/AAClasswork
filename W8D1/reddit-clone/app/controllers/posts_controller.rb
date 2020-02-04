class PostsController < ApplicationController
  before_action :require_logged_in

  def new
    @post = Post.new
    render :new
  end

  def create
    post = Post.new(post_params)
    post.author_id = params[:author_id]

    if post.save
      redirect_to post_url(post)
    else
      flash[:errors] = post.errors.full_messages
      render :new
    end
  end

  def edit
    
  end

  def update

  end

  def show

  end

  def destroy

  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content. :sub_id)
  end
end
