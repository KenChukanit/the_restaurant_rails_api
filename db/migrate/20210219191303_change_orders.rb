class ChangeOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :has_been_ordered_times, :integer
    remove_column :orders, :item_status, :integer
    remove_column :orders, :order_number, :bigint
    add_column    :orders, :status,  :integer, default: 0
  end
end
