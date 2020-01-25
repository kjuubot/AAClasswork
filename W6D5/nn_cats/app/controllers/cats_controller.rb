class CatsController < ApplicationController
  def index
    @kitties = Cat.all  
    render :index
  end

  def show
    @kitty = Cat.find(params[:id])
    render :show
  end

  def new
    @kitty = Cat.new
    render :new
  end

  def create
    kitty = Cat.new(cat_params)

    if kitty.save
      redirect_to cat_url(kitty)
    else
      render json: cat.errors.full_messages, status: 422
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end
end
