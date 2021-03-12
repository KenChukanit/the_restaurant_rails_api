class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    
    before_action  :user_id
    def current_user
        @current_user ||= User.find_by_id session[:user_id]
    end
    helper_method(:current_user)
  
    def user_signed_in?
        current_user.present?
    end
    helper_method :user_signed_in?

    def authenticate_user!
        redirect_to new_session_path, notice: 'Please sign in' unless user_signed_in?
    end
    def user_id
        @user = User.find_by_id session[:user_id]
    end

end
