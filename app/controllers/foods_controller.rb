class FoodsController < ApplicationController

    before_action :authenticate_user!, only: [:new, :edit]
    before_action :get_food, only: [:show, :edit, :update, :destroy] #these are the functions i need to find a specific type of food
    def index

        if params[:category].blank?
            @foods = Food.all.order("created_at DESC")
        else
            @c_id = Category.find_by(name: params[:category]).id
            @foods = Food.where(:category_id => @c_id).order("created_at DESC")
        end
    end

    def show
    end

    def new
        @food = current_user.foods.build #current users upload books
        @categories = Category.all.map{|x| [x.name, x.id]}

    end

    def create
        @food = current_user.foods.build(food_params)
        @food.category_id = params[:category_id]

        if @food.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
        @categories = Category.all.map{|x| [x.name, x.id]}
    end

    def update
        @food.category_id = params[:category_id]

        if @food.update(food_params)
            redirect_to food_path(@food)
        else
            render 'edit'
        end
    end

    def destroy
        @food.destroy
            redirect_to root_path
    end

    def contact
    end

    def request_contact
      name = params[:name]
      email = params[:email]
      telephone = params[:telephone]
      message = params[:messgage]

      if email.blank?
        flash[:alert] = I18n.t('home.request_contact.no_email')
      else
        # send email
        flash[:notice] = I18n.t('home.request_contact.email_sent')
      end

      redirect_to_root_path
    end

    private

        def get_food  # i will need to find the food method for other functions in the website or deleting them therefore this method is used to save time
            @food = Food.find(params[:id])
        end

        def food_params
            params.require(:food).permit(:name, :description, :ingrediants, :category_id, :food_image)
        end

end
