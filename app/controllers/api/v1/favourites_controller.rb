class Api::V1::FavouritesController < Api::ApplicationController

    def index
        favourites = current_user.favoured_foods.order(created_at: :desc)
        render json: favourites 
    end

    def create
        food = Food.find params[:food_id]
        favourite = Favourite.new user: current_user, food: food
        if favourite.save
    
            render json:{id: favourite.id}
        else
         
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
# render json:{
#     jwt: encode_token({
#         id: user.id,
#         username: user.username,
#         isStaff: user.isStaff
#     })
# }