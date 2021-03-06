class AddAmountToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :total_amount, :decimal, precision: 10, scale: 2
  end
end
