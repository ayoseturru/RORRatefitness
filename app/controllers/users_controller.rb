class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, only: [:edit, :update]

  def new
    if session[:username]
      flash[:alert] = "Debe cerrar la sesión en primer lugar"
      redirect_to root_url
    end
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: 'User successfully created'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to articles_path, notice: 'User successfully updated'
    else
      render action: :edit
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :name)
  end
end