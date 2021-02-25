class Api::V1::ReviewsController < Api::ApplicationController
    
    def create
        food = Food.find params[:food_id]
        body = params[:body]
        rating = params[:rating]
        review = Review.new review_params 
        review.user = current_user 
        review.food = food
        if review.save
        redirect_to foods_path, notice: "Review created"
        end
        render json:{id: review.id}
    end


    private
    def review_params 
        params.require(:review).permit(:body, :rating)
    end
end
