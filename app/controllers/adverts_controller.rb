class AdvertsController < ApplicationController
  before_action :authenticate, only: [:edit, :update, :destroy, :create]

  def create
    @advert = Advert.new(user: current_user, description: params[:description], title: params[:title])
    if @advert.save
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js { render "fail_create.js.erb" }
      end
    end
  end

  def destroy
    @advert = current_user.adverts.find(params[:id])
    if @advert.destroy
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js { render "fail_destroy.js.erb" }
      end
    end
  end

  def update
    @advert = current_user.adverts.find(params[:id])
    if @advert.update(advert_params)
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def advert_params
    params.require(:advert).permit(:title, :description, :user)
  end
end
