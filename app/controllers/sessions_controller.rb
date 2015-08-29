class SessionsController < ApplicationController
  def create
    User.omniauth(request.env['omniauth.auth']).tap do |user|
      session[:user_id] = user.id
    end
    redirect_to root_url
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end
end
