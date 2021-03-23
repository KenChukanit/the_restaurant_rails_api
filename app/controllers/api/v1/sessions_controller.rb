class Api::V1::SessionsController < Api::ApplicationController
    
    def create
        user=User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id]=user.id
            token = encode_token({id: user.id})
            render json: {
                jwt: encode_token({
                    id: user.id,
                    username: user.username,
                    isStaff: user.isStaff
                })
              }
        else
            render(
                json: {
                  errors: [{
                    type: "NotFound"
                  }]
                },
                status: :not_found
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
    def encode_token(payload = {}, exp = 24.hours.from_now)

        JWT.encode(
          payload,
          Rails.application.secrets.secret_key_base
        )
      end
end
