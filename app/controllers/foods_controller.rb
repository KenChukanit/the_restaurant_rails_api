class FoodsController < ApplicationController

    def index
        @foods = Food.all.order(created_at: :desc)
        @review = Review.new
        order_cart = [];
        @Order = Order.new
    end

    def new
        @food = Food.new
    end

    def create
        @food = Food.new food_params
        if @food.save
            flash[:notice] = "Created a new menu"
            redirect_to foods_path
        else
            render :new
        end
    end

    def show
        @food = Food.find params[:id]
        @reviews=@food.reviews.order(created_at: :desc)
        @review=Review.new
        
    end

    def edit
        @food = Food.find params[:id]
    end

    def update
        if @food.update food_params
            redirect_to foods_path(@food.id), notice: "Edited the menu"
        else
            render :edit
        end
    end

    def destroy
        @food = Food.find params[:id]
        if @food.destroy
            redirect_to foods_path, notice: "The menu is deleted"
        else
            render :edit
        end
    end
    private

    def food_params
        params.require(:food).permit(:food_name, :calories, :price, :img_url, :ingredients)
    end

end
