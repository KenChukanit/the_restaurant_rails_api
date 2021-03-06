class OrderSerializer < ActiveModel::Serializer
  attributes :id,
              :status,
              :table_number,
              :food_ids,
              :user_ids,
              :created_at,
              :total_amount,
              :total_plus_tax

  has_many :users, through: :user_orders
  class UserSerializer < ActiveModel::Serializer
    attributes :id,
                :username,
                :isStaff
  end     

  has_many :foods, through: :food_orders
  class FoodSerializer < ActiveModel::Serializer
    attributes :id,
                :food_name,
                :price
  end     
  
 
end