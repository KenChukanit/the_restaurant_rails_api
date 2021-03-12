class Api::V1::PaymentsController < Api::ApplicationController

    def index
        payments = Payment.all.order desc: :created_at
        render json: payments
    end

    def create
        order_id = params[:order_id]
        order = Order.find_by_id order_id
        customer_name = params[:customer_name]
        customer_number = params[:customer_number]
        amount_paid = params[:amount_paid]
        stripe_id = params[:stripe_id]
        email = params[:email]
        payment = Payment.create(order_id: order_id, 
                                customer_number: customer_number,
                                customer_name: customer_name,
                                amount_paid: amount_paid,
                                email: email,
                                stripe_id: stripe_id)
            payment.user = current_user
            if payment.save
            PaymentMailer.payment_received(payment).deliver_now
            order.update(payment_status: "paid")
            render json:{id: payment.id}
            else
            render(
            json: {errors: payment.errors},
            status: 422 # unprocessible entity HTTP status code
            )
            end
    end

end
