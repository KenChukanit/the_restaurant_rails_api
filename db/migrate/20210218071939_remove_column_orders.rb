class RemoveColumnOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :order_date, :datetime
  end
end
