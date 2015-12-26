class ReviewsController < ApplicationController
  def destroy
    @center = Center.find(params[:center_id])
    if @center.nil?
      redirect_to :back, notice: "operación no permitida"
    else
      review = @center.reviews.find_by_id(params[:id])
      if review.user == current_user
        review.destroy
        redirect_to @center, notice: 'Comment deleted'
      end
    end
  end
end