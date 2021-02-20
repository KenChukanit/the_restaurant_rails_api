class OrdersController < ApplicationController
    def new
        @order = Order.new
    end


    def create
        @order = Order.new order_params
        if user
        @order.user = current_user 
        else   
        @order.user = User.first #Anonymous user
        end
    end

    def show

    end

    private
    def order_params 
        params.require(:order).permit(:food_id [], :user_id)
    end


end
