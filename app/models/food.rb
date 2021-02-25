class Food < ApplicationRecord
    

    has_many :reviews
    has_many :food_orders, dependent: :destroy
    has_many   :orders, through: :food_orders

    validates   :food_name, presence: true, uniqueness: true
    validates   :calories, presence: true
    validates   :price, presence: true
    validates   :img_url, presence: true, uniqueness: true
    validates   :ingredients, presence: true
    def self.add_q(sale_quantities)
        @sale_quantities = sale_quantities + 1
    end
end
