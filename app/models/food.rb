class Food < ApplicationRecord
    before_save  :capitalize_title

    belongs_to  :order, optional: true
    has_many :reviews

    validates   :food_name, presence: true, uniqueness: true
    validates   :calories, presence: true
    validates   :price, presence: true
    validates   :img_url, presence: true, uniqueness: true
    validates   :ingredients, presence: true
end
