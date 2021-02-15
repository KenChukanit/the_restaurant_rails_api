class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.integer :times_of_orders
      t.references :food, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :item_status, default: 0

      t.timestamps
    end
  end
end
