class FoodSerializer < ActiveModel::Serializer
  attributes  :id,
              :food_name,
              :price,
              :ingredients,
              :calories,
              :img_url,
              :sales_quantities

    has_many  :reviews

    class ReviewSerializer < ActiveModel::Serializer
    attributes :id,
        :body,
        :rating,
        :created_at,
        :updated_at
    

        belongs_to :user, key: :reviewer

    class UserSerializer < ActiveModel::Serializer
      attributes :id,
                  :username
    end
      
    end
end
