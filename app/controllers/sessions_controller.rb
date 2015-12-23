class SessionsController < ApplicationController
  def create
    if user= User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      session[:username] = user.username
      redirect_to root_url
    else
      flash.now[:alert] = "invalid login/password combination"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end