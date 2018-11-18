class FoodsController < ApplicationController
    before_action :get_food, only: [:show, :edit, :update, :destroy] #these are the functions i need to find a specific type of food 

    def index 
        @foods = Food.all.order("created_at DESC")
    
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
    
    private 
        
        def get_food  # i will need to find the food method for other functions in the website or deleting them therefore this method is used to save time
            @food = Food.find(params[:id]) 
        end
        
        def food_params
            params.require(:food).permit(:name, :description, :ingrediants, :category_id)
        end

end

