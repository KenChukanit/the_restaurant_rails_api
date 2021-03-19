class Api::V1::SessionsController < Api::ApplicationController
    
    def create
        user=User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id]=user.id
            token = encode_token({id: user.id})
            render json: {
                jwt: encode_token({
                    id: user.id,
                    username: user.first_name,
                    isStaff: user.isStaff
                })
              }
        else
            render(
                json: {errors: "Invalid input"},
                status: 404
            )
        end
    end
    def get_current_user

        render json: current_user
    end
    def destroy
        session[:user_id]=nil
        render(
            json: {logged_out: true},
            status: 200
        )
    end

    private
    def encode_token(payload={})
        exp = 24.hours.from_now
        payload[:exp] = exp.to_i
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end
end
