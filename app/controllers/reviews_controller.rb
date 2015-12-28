class ReviewsController < ApplicationController
  before_action :authenticate, only: [:edit, :update, :destroy, :create]

  def destroy
    @center = Center.find(params[:center_id])
    @review = Review.find(params[:id])
    if @review.nil? or (@review.user != current_user)
      redirect_to :back, notice: "operación no permitida"
    else
      @review.destroy
      redirect_to @center, notice: 'Reseña eliminada'
    end
  end

  def create
    @center = Center.find(params[:center_id])
    @review = Review.new(title: params[:title], comment: params[:comment],
                         center: @center, user: current_user, rate: getMedia(params))
    if @review.save
      flash[:notice] = "Se ha añadido su reseña correctamente"
      redirect_to @center
    else
      redirect_to @center, flash[:review_error] = @review.errors
    end
  end

  def getMedia(params)
    return ((params[:infraestructure].to_f + params[:activities].to_f +
        params[:attention].to_f + params[:cleaning].to_f + params[:bathroom].to_f) / 5.0)
  end

end