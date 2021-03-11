class Api::V1::FoodsController < Api::ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    def index 
        foods= Food.all.all_with_reviews_counts.all_with_orders_counts.order created_at: :desc
        render json: foods , each_serializer: FoodSerializer
       
    end
    def show
        @food = Food.find params[:id]
        @reviews=@food.reviews.order(created_at: :desc)
        @review=Review.new
        
        render json: @food
    end

    def get_me_food
        quantity = params[:quantity]
        
    end

end
