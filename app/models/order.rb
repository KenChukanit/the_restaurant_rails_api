class Order < ApplicationRecord
 

  enum status:    [:Active, :Closed, :Cancelled]
  has_many  :food_orders, dependent: :destroy
  has_many  :foods, through: :food_orders

  has_many  :user_orders, dependent: :destroy
  has_many  :users, through: :user_orders

  validates   :food_ids, presence: true
end
