class Api::V1::FoodsController < Api::ApplicationController
    def index 
        foods= Food.order created_at: :desc
        render json: foods , each_serializer: FoodSerializer
       
    end
    def show
        @food = Food.find params[:id]
        @reviews=@food.reviews.order(created_at: :desc)
        @review=Review.new
        
        render json: @food
    end

end
