class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def create
    @username = params[:username]
  end
end
