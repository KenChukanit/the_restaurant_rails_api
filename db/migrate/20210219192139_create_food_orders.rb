class CreateFoodOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :food_orders do |t|
      t.references :food, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :item_status, default: 0

      t.timestamps
    end
  end
end
