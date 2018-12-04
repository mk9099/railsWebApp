class ReviewsController < ApplicationController
  before_action :get_review, only: [:edit, :update, :destroy]
  before_action :get_food
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.food_id = @food.id

    if @review.save
      redirect_to food_path(@food)
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to food_path(@food)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to food_path(@food)
  end

  private

    def get_review
      @review = Review.find(params[:id])
    end


    def get_food

      @food = Food.find(params[:food_id]) #use food_id review is with the foods id

    end

    def review_params

      params.require(:review).permit(:rating, :comment)

    end



end
