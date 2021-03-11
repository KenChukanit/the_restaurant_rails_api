class User < ApplicationRecord
    before_save  :capitalize_name
    has_secure_password
    has_many :reviews
    has_many :user_orders, dependent: :destroy
    has_many :orders, through: :user_orders
    has_many :favourites
    has_many :favoured_foods, through: :favourites, source: :food
    has_many :payments

    geocoded_by :address
    after_validation :geocode

    validates :username, presence: true, length: { maximum: 15 },uniqueness: { case_sensitive: false }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 3 }, :if => :password
    validates :phone_number,:presence => true,
                :uniqueness => true,
                :numericality => true,
                :length => { :minimum => 10, :maximum => 15 }

    def user_name
        "#{username.capitalize}"
    end

    private
    def capitalize_name
        self.username.capitalize
    end
end
