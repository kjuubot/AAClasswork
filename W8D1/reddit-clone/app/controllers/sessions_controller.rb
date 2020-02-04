class SessionsController < ApplicationController
  before_action :require_logged_in, only: [:destroy]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      log_in(@user)
      redirect_to users_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    logout
    render :new
  end
end
