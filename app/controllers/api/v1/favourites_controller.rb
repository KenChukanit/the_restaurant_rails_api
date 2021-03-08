class Api::V1::FavouritesController < Api::ApplicationController

    def index
        favourites = current_user.favoured_foods.order(created_at: :desc)
        render json: favourites 
    end

    def create
        food = Food.find params[:food_id]
        favourite = Favourite.new user: current_user, food: food
        if !can?(:favourite, food)
            flash[:alert] = "You can't favourite your own product"
        elsif favourite.save
            flash[:success] = "Product favourited!"
            render json:{id: favourite.id}
        else
            flash[:warning] = favourite.errors.full_messages.join(', ')
            render json:{errors: favourite.errors },
            status: 422 
        end
    end

    def destroy
        favourite = Favourite.find params[:id]
        if can? :destroy, favourite
            favourite.destroy
            head :ok
        else 
            head :bad_request
        end
    end
end
