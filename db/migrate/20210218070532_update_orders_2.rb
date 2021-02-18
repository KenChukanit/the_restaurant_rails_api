class UpdateOrders2 < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :table_number, :string
  end
end
