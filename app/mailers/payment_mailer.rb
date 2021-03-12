class PaymentMailer < ApplicationMailer 
    def test
     
        mail(
            to: 'suvimon172@hotmail.com',
            from: 'c@example.com',
            cc: '',
            bcc: '',
            subject: 'Hello, World!'
        )
    end
    def payment_received(payment)
        @payment = payment
        @amount = payment.amount_paid
        @order_id = payment.order_id
        @customer = payment.customer_name
        @email = payment.email
        mail(
            to: "#{@email}",
            subject: "Thank you #{@customer} for you order"
        )
    end
end
