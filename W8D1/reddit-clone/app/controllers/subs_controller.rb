class SubsController < ApplicationController

  before_action :require_logged_in, except: [:index]
  
  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    sub.mod_id = params[:mod_id]

    if sub.save
      redirect_to sub_url
    else
      flash[:errors] = sub.errors.full_messages
      render :new
    end
  end

  def show
    sub = Sub.find_by(title: params[:title])
    render :show
  end

  def edit
    @sub = Sub.find_by(title: params[:title])
    if @sub.mod_id == current_user.id
      render :edit
    end
  end

  def update
    sub = Sub.find_by(title: params[:title])
    if sub.update(sub_params)
      redirect_to sub_url(sub)
    else
      flash[:errors] = sub.errors.full_messages
      render :new
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end
