class Api::ApplicationController < ApplicationController
    skip_before_action :verify_authenticity_token
    private
    def authenticate_user!
        render(
            json: {errors: 'You are not logged in'},
            status: 422
        ) unless user_signed_in?
    end
    def record_invalid(error)
        
        invalid_record=error.record

        errors=invalid_record.errors.map do |field,message|
            {
                type: error.class.to_s,
                record_type: invalid_record.class.to_s,
                field: field,
                message: message
            }
            
        end
        render(
            json:{ status: 422, errors: errors},
            status: 422
        )
    end
end
