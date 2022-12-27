class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def review
    user = User.find(params[:id])
    @item = Item.find(params[:item_id])

    new_review = Review.new(review_params)
    new_review.user_id = user.id
    new_review.item_id = @item.id

    if new_review.save
      redirect_to request.referer
    else
      @review = Review.new
      render template: "items/show"
    end
  end


  # private
  def review_params
    params.require(:review).permit(:body)
  end
end
