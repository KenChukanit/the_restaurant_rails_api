class Review < ApplicationRecord
  belongs_to :food
  belongs_to :user

  
  validates   :rating, presence: {message: "Rating must be provided"}
end
