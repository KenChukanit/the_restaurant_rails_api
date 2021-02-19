class User < ApplicationRecord
    has_secure_password
    has_many :reviews

    def user_name
        "#{username.capitalize}"
    end

end
