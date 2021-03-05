class Api::V1::SessionsController < Api::ApplicationController
    def create
        user=User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id]=user.id
            render json:{id: user.id}
        else
            render(
                json: {status: 404},
                status: 404
            )
        end
    end
    def get_current_user
        orders = current_user.orders
        render json: current_user
    end
    def destroy
        session[:user_id]=nil
        render(
            json: {logged_out: true},
            status: 200
        )
    end
end
