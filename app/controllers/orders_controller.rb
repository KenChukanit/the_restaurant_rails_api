class OrdersController < ApplicationController
    def new
        @order = Order.new
    end


    def create
        @food = Food.find params[:food_id]
        @order = Order.new order_params
        if user
        @order.user = current_user 
        else   
        @order.user = "anonymous"
        end

      
    end

    private
    def order_params 
        params.require(:order).permit(:food_id [], :user_id)
    end


end
