class ReviewsController < ApplicationController

  before_action :get_food

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.food_id = @food.id

    if @review.save
      redirect_to @review
    else
      render 'new'
    end

  end




  private

    def get_food

      @food = Food.find(params[:food_id]) #use food_id review is with the foods id

    end

    def review_params

      params.require(:reivew).permit(:rating, :comment)

    end



end
