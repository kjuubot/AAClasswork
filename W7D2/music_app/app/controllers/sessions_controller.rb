class SessionsController < ApplicationController
    def self.create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])

        session[:session_token] = user.reset_session_token!
        redirect_to user_url(user)
    end
end
