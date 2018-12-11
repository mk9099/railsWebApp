class ReviewsController < ApplicationController
  before_action :get_review, only: [:edit, :update, :destroy]
  before_action :get_food
  before_action :authenticate_user!, only: [:new, :edit]

  def new
    @review = Review.new #declaring a new review
  end

  def create
    @review = Review.new(review_params) #reviews created using its needed parameters
    @review.user_id = current_user.id #sets user id
    @review.food_id = @food.id #sets food id

    if @review.save
      redirect_to food_path(@food) #if saved it will go to the food path
    else
      render 'new' #else it will follow the new method
    end

  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to food_path(@food) #if the updated review follows the params it will redirect to the food path
    else
      render 'edit' #else it will follow the edit method
    end
  end

  def destroy
    @review.destroy
    redirect_to food_path(@food) #if it is destroyed ut will follow the food path
  end

  private

    def get_review
      @review = Review.find(params[:id]) #this will allow the reivews to be found for methods that need it
    end


    def get_food

      @food = Food.find(params[:food_id]) #this will allow the fooods ids to be found for methods that need it

    end

    def review_params

      params.require(:review).permit(:rating, :comment) #reuired parameters for a review form to be passed

    end



end
