class FoodsController < ApplicationController
    before_action :find_food, only: [:show, :edit, :update, :destroy] #these are the functions i need to find a specific type of food 

    def index 
        @foods = Food.all.order("created_at DESC")
    
    end
    
    def show 
    end 
     
    def new
        @food = Food.new 
    end 
    
    def create
        @food = Food.new(food_params)
        
        if @food.save 
            redirect_to root_path
        else
            render 'new'
        end
         
    end
    
    private 
        
        def food_params
            params.require(:food).permit(:name, :description, :ingrediants)
        end
        
        def get_food  # i will need to find the food method for other functions in the website or deleting them therefore this method is used to save time
            @food = Food.find(params[:id]) 
        end

end
