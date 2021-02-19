class FoodSerializer < ActiveModel::Serializer
  attributes  :id,
              :food_name,
              :price,
              :ingredients,
              :calories,
              :img_url,
              :sales_quantities,
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
  
end
