class Order < ApplicationRecord
  belongs_to :food
  belongs_to :user

  enum status:    [:in_process, :served, :cancelled, :out_of_order]
end
