class OrderMailer < ApplicationMailer
    def order_received(order)
        @order = order
        @customer = @order.users[0]
        @total_plus_tax = @order.total_plus_tax
        @name = @customer.username
        @email = @customer.email
        @foods = @order.foods
        food_name_array = @foods.map{|food| food.food_name}
        mail(
            to: "#{@email}",
            subject: "Order received from #{@name} "
        )
    end
end
