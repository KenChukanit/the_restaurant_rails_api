class FoodSerializer < ActiveModel::Serializer
  attributes  :id,
              :food_name,
              :price,
              :ingredients,
              :img_url,
              :reviews

  has_many :reviews
  class ReviewSerializer < ActiveModel::Serializer
   
    attributes :id,
        :body,
        :rating,
        :created_at,
        :updated_at,
        :reviewer,
  
      
      def reviewer
          object.user&.user_name
      end
    
      belongs_to :user, key: :reviewer
      class UserSerializer < ActiveModel::Serializer
        attributes :id,
                  :username,
                  :isStaff
      end
    end

    has_many :orders, through: :food_orders
    class OrderSerializer < ActiveModel::Serializer
      attributes :id,
                  :status,
                  :table_number,
                  :food_ids,
                  :user_ids,
                  :created_at,
                  :total_amount

    has_many :users, through: :user_orders
    class UserSerializer < ActiveModel::Serializer
      attributes :id,
                  :username,
                  :isStaff
    end     

    end

    has_many  :favouriters, through: :favourites, source: :user
    class FavouriteSerializer < ActiveModel::Serializer
      attributes :id,
                  :user_id
    end

end
