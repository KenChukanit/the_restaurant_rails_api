class Api::ApplicationController < ApplicationController
    
    skip_before_action :verify_authenticity_token
 

    def not_found
        render(
          json: {
            errors: [{
              type: "NotFound"
            }]
          },
          status: :not_found # :not_found is alias for 404 in rails
        )
      end

    private
    def auth_header
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']
      end
    
      private
      def current_user
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
          @user ||= User.find_by(id: payload["id"])
        rescue JWT::DecodeError => error
          nil
        end
      end
      helper_method :current_user

    
    def user_signed_in?
        current_user.present?
    end
    
    def authenticate_user!
        unless current_user.present?
        render(
            json: {
            errors: [{
                type: "Unauthorized"
            }]
            },
            status: :unauthorized # alias for status code 401
        )
        end
    end

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
      end

  protected
    def record_not_found(error)
            render(
            json: {
                errors: [{
                type: error.class.to_s,
                message: error.message
                }]
            },
            status: :not_found
            )
    end

    def standard_error(error)
        logger.error "#{error.class.to_s} #{error.message}"
        logger.error error.backtrace.join("\r\n")
            render(
            json: {
                errors: [{
                type: error.class.to_s,
                message: error.message
                }]
            },
            status: :internal_server_error # alias for status code 500
            )
    end

    def record_invalid(error)
        record = error.record
            errors = record.errors.map do |field, message|
            {
                type: error.class.to_s,
                record_type: record.class.to_s,
                field: field,
                message: message
            }
            end

        render(
        json: {
            errors: errors
        },
        status: :unprocessable_entity # alias for status code 422
        )
    end
end
