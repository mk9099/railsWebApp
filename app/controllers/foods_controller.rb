class FoodsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :edit] #will authenitcate user for only the new and edit functions
    before_action :get_food, only: [:show, :edit, :update, :destroy] #these are the functions i need to find a specific type of food

    rescue_from ActiveRecord::RecordNotFound, with: :noresult

    def noresult
      redirect_to errorpage_path
    end

    def errorpage
    end

    def index #this is the home page of my website
        if params[:category].blank?
            @foods = Food.all.order("created_at DESC")
        else
            @c_id = Category.find_by(name: params[:category]).id
            @foods = Food.where(:category_id => @c_id).order("created_at DESC")
        end
    end

    def show
      if @food.reviews.blank? #so if there are no reviews for an item the average will display 0
        @average_review = 0
      else
        @average_review = @food.reviews.average(:rating).round(2) #else it will calculate the average using the ratings and round it to 0.5 so it can display full and half stars
      end
    end

    def new
        @food = current_user.foods.build #current users upload books
        @categories = Category.all.map{|x| [x.name, x.id]}

    end

    def create
        @food = current_user.foods.build(food_params) #current user is creating a food which is to match the specified parameters for a food item
        @food.category_id = params[:category_id] #setting the foods id so it can be stored with a specified id

        if @food.save
            redirect_to root_path #if the food item is succesfully saved the user will be redirected to the root path
        else
            render 'new' #else it will follow the new method
        end
    end

    def edit
        @categories = Category.all.map{|x| [x.name, x.id]}
    end

    def update
        @food.category_id = params[:category_id]

        if @food.update(food_params) #if the food is updated with the correct params it will redirect to the food path
            redirect_to food_path(@food)
        else
            render 'edit' #else it will follow the edit method
        end
    end

    def destroy
        @food.destroy
            redirect_to root_path #if the food is succesfully destroyed it will go to the rootpath
    end
Ubuntu
    def contact
    end

    def request_contactUbuntu
      name = params[:name]
      email = params[:email]              #setting the paramters for the users input of name, email etc.
      telephone = params[:telephone]
      message = params[:messgage]

      if email.blank?
        flash[:alert] = I18n.t('foods.request_contact.no_email') #if no email is inputed it will not send an email
      else
        # send email
        flash[:notice] = I18n.t('foods.request_contact.email_sent')
      end

      redirect_to root_path #after these it will go to the root path
    end

    private

        def get_food  # i will need to find the food method for other functions in the website or deleting them therefore this method is used to save time
            @food = Food.find(params[:id])
        end

        def food_params #so the foods that are beind added need to have a name, desceitpion etc
            params.require(:food).permit(:name, :description, :ingrediants, :category_id, :food_image)
        end

end
