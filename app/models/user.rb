class User < ApplicationRecord
    before_save  :capitalize_name
    has_secure_password
    has_many :reviews
    has_many :user_orders, dependent: :destroy
    has_many   :orders, through: :user_orders
    def user_name
        "#{username.capitalize}"
    end

    private
    def capitalize_name
        self.username.capitalize
    end
end
