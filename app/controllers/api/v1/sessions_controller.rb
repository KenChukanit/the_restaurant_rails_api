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
        token = request.headers["AUTHORIZATION"]

        # The decoded token will be array containing
        # the payload and the JWT header in that order.
        begin
        payload = JWT.decode(
            token,
            Rails.application.secrets.secret_key_base
        )&.first

        # To get a value from payload, make sure to use
        # strings to access the keys. The payload's hash's
        # keys are all strings and not symbols.
        current_user ||= User.find_by(id: payload["id"])
        rescue JWT::DecodeError => error
        nil
        end
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
