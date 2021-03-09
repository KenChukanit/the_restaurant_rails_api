class UpdateOrderTablePaymentStatus < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :table_number, :string
    add_column    :orders, :payment_status, :string,  default: "unpaid"
  end
end
