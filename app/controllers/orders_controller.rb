class OrdersController < ApplicationController
    def new
        @order = Order.new
    end


    def create
        @order = Order.new order_params
        @order.users = [current_user]
        food_ids.each do |id| 
            food = Food.find_by id  
            sale_quantities = food.sale_quantities
            food.add_q(sale_quantities)
        end
        if @order.save
            flash[:notice] = "Created a new order"
            redirect_to orders_path(@order)
        else
            render :new
        end
    end

    def index
        @orders=Order.all.order(created_at: :desc)
    end

    def show
        @order = Order.find params[:id]
        @foods = @order.foods
    end


    private
    def order_params
        params.require(:order).permit(:table_number,user_ids:[],food_ids:[])
    end


end