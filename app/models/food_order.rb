class FoodOrder < ApplicationRecord
  belongs_to :food
  belongs_to :order

  enum status:    [:in_process, :served, :cancelled, :out_of_order]
end
