class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.string :stripe_id
      t.string :customer_name
      t.string :customer_number
      t.decimal :amount_paid, precision: 10, scale: 2
      t.references :order, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
