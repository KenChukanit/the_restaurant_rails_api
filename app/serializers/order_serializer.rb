class OrderSerializer < ActiveModel::Serializer
  attributes :id,
              :status,
              :table_number,
              :food_ids
              :user_ids

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
  has_many :food_orders
  class FoodOrderSerializer < ActiveModel::Serializer
    attributes :food_id,
                :food_status

      def food_status
       food_status = [:in_process, :served, :cancelled, :out_of_order][object.item_status]
      end
  end     
end