class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    session[:session_token] = user.reset_session_token!

    redirect_to cats_url
  end

  def destroy
    self.current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
  end
end
