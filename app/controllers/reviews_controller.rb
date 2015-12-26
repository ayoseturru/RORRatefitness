class ReviewsController < ApplicationController
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
    @media = getMedia(params)
    # @review = Review.new(user: current_user, center: params[:center], rate: @media)
    @center = Center.find(params[:center_id])
    @review = Review.new(title: params[:title], comment: params[:comment],
                         center: @center, user: current_user, rate: getMedia(params))
    # @infraestructure = params[:infraestructure]
    # @activities = params[:activities]
    # @attention = params[:attention]
    # @cleaning = params[:cleaning]
    # @bathroo = params[:bathroom]
    # @title = params[:title]
    # @comment = params[:comment]
    # @center_id = Center.find(params[:center_id]).name
    if @review.save
      redirect_to @center
    else
      redirect_to :back, flash[:review_error] = @review.errors
    end
    # @media = getMedia(params)
  end

  def getMedia(params)
    return ((params[:infraestructure].to_f + params[:activities].to_f +
        params[:attention].to_f + params[:cleaning].to_f + params[:bathroom].to_f) / 5.0)
  end
end