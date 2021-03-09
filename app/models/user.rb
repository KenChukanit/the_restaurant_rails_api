class User < ApplicationRecord
    before_save  :capitalize_name
    has_secure_password
    has_many :reviews
    has_many :user_orders, dependent: :destroy
    has_many   :orders, through: :user_orders
    has_many :favourites
    has_many :favoured_foods, through: :favourites, source: :food
    has_many :payments
    def user_name
        "#{username.capitalize}"
    end

    private
    def capitalize_name
        self.username.capitalize
    end
end
