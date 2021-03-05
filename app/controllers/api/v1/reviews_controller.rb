class Api::V1::ReviewsController < Api::ApplicationController
    
    def create
        food = Food.find params[:food_id]
        body = params[:body]
        rating = params[:rating]
        food_id = params[:food_id]
        user_id = params[:user_id]
        review = Review.create(body: body, rating: rating, food_id: food_id,user_id: user_id)
    
        if review.save
        render json:{id: review.id}
        else
            render json:{errors: review.errors },
            status: 422 
        end
    end

    def destroy
        food = Food.find params[:food_id]
        review = Review.find params[:id]
        if review.destroy
            head :ok
        else
            head :bad_request
        end
    end

    private
    def review_params 
        params.require(:review).permit(:body, :rating)
    end
end
