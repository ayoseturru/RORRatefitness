class SessionsController < ApplicationController
  def create
    @username = params[:username]
  end
end
