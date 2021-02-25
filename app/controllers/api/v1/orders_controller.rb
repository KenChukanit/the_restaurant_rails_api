class Api::V1::OrdersController < Api::ApplicationController
    def index 
        orders= Order.order created_at: :desc
        render json: orders , each_serializer: OrderSerializer
       
    end
    def show
        @order = Order.find params[:id]
    
        
        render json: @order
    end

    def create
        table_number = params[:table_number]
        food_ids = params[:food_ids]
        order=Order.create(table_number: table_number, food_ids: food_ids)
        order.users = [current_user]
        
        
        if order.save
            render json:{id: order.id}
        else
            render(
                json: {errors: order.errors},
                status: 422 # unprocessible entity HTTP status code
            )
        end
    end

    def get_current_order
        current_order = Order.last
        if current_order.users == current_user
            render json: current_order
        end
        
    end

    private
    def order_params
        params.require(:order).permit(:table_number,user_ids:[],food_ids:[])
    end
end
