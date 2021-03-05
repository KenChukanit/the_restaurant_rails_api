class Food < ApplicationRecord
    before_save :downcase_name

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

    def self.all_with_reviews_counts
        self.left_outer_joins(:reviews)
            .select("foods.*","Count(reviews.*) AS reviews_count")
            .group('foods.id')
    end

    def self.all_with_orders_counts
        self.left_outer_joins(:orders)
            .select("foods.*","Count(orders.*) AS orders_count")
            .group('foods.id')
    end
    private
    def downcase_name
        self.name&.downcase!
    end
    #Question.select('avg(view_count)) as count').group('title')
    #Question.where(['view_count < ?', 10]).where(['body ILIKE ?', '%question%']).order(id: :DESC).limit(1).offset(1)
end
