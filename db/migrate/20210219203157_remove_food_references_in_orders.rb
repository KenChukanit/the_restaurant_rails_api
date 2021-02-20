class RemoveFoodReferencesInOrders < ActiveRecord::Migration[6.1]
  def change
    remove_reference :orders, :food,  foreign_key: true
  end
end
