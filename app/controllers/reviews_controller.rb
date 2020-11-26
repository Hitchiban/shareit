class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @device = Device.find(params[:device_id])
  end

  def create
    @device = Device.find(params[:device_id])
    @review = Review.new(review_params)
    @review.device = @device
    if @review.save
      redirect_to device_path(@device)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
