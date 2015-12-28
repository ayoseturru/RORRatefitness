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
      redirect_to root_url, notice: 'Bienvenido a RateFit, en la esquina superior derecha puedes iniciar sesion clickando en el usuario'
    else
      render action: :new
    end
  end

  def edit
  end

  def index
    @users = User.where_municipality(params[:mun_user].downcase)
    if @users
      respond_to do |format|
        format.html
        format.js
      end
    else
      respond_to do |format|
        format.js { render "fail_search.js.erb" }
      end
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    if !@user
      redirect_to "/searchs", notice: "El usuario no existe" and return false
    elsif @user.adverts.count == 0
      redirect_to "/searchs", notice: "¡El usuario #{@user.name} no posee anuncios, ponte en contacto con él y animale a crear uno! Su email: #{@user.email}" and return false
    end
  end

  def update
    if @user.update(user_params)
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js { render "fail_update.js.erb" }
      end
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :name, :municipality)
  end
end