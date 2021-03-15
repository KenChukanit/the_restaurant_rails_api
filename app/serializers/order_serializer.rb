class OrderSerializer < ActiveModel::Serializer
  attributes :id,
              :status,
              :food_ids,
              :user_ids,
              :created_at,
              :total_amount,
              :total_plus_tax,
              :payment_status

  has_many :users, through: :user_orders
  class UserSerializer < ActiveModel::Serializer
    attributes :id,
                :username,
                :isStaff,
                :phone_number,
                :longitude,
                :latitude,
                :address
  end     

  has_many :foods, through: :food_orders
  class FoodSerializer < ActiveModel::Serializer
    attributes :id,
                :food_name,
                :price
  end     
  
 
end