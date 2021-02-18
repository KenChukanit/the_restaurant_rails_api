class ReviewsController < ApplicationController
 
    def new
        @review = Review.new
    end

    def create
        @food = Food.find params[:food_id]
        @review = Review.new review_params
        @review.user = current_user 
        @review.food = @food
        if @review.save
        redirect_to foods_path, notice: "Review created"
        end
    end

    def destroy
        @food = food.find params[:food_id]
        @review = Review.find params[:id]
        @review.destroy
        redirect_to food_path(@food), notice: "Review deleted" 
    end

    private
    def review_params 
        params.require(:review).permit(:body, :rating)
    end

end
