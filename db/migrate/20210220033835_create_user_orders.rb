class CreateUserOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :user_orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
