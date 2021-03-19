class Api::V1::OrdersController < Api::ApplicationController
  
   
    def index 
    
        orders= Order.all.order created_at: :desc
        render json: orders , each_serializer: OrderSerializer
       
    end

    def show
        @order = Order.find params[:id]
    
        render json: @order
    end

    def create
        food_ids = params[:food_ids]
        food_price_array = food_ids.map{|id| (Food.find_by_id id).price}
        total_amount = food_price_array.reduce(0){|sum,price| sum+price}
        total_plus_tax = total_amount*1.05
        order=Order.create(total_amount: total_amount, 
                            total_plus_tax: total_plus_tax,
                            food_ids: food_ids)
        order.users = [current_user]
        if order.save
            OrderMailer.order_received(order).deliver_now
            render json:{id: order.id}
        else
            render(
                json: {errors: order.errors},
                status: 422 # unprocessible entity HTTP status code
            )
        end
    
    end

    def order_user
        if current_user.orders
        @orders ||= current_user.orders.order created_at: :asc
        render json: @orders 
        else  
            @orders = Order.new
            render json: @orders
        end
    end

   
    def update
        status = params[:status]
        @order = Order.find params[:id]
        if @order.update(status: status)

            render json: {id: @order.id}
        else
            render(
                json: {errors: @order.errors},
                status: 422
            )
        end
    end

    def destroy
        @order = Order.find params[:id]
        if @order.destroy
            head :ok
        else
            head :bad_request
        end
    end

    private
    def order_params
        params.require(:order).permit(:total_amount,:total_plus_tax, user_ids:[],food_ids:[])
    end
 
 
end
