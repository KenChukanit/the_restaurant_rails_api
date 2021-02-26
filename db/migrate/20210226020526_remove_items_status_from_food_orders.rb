class RemoveItemsStatusFromFoodOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :food_orders, :item_status, :integer
  end
end
