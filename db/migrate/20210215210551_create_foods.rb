class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string  :food_name
      t.integer  :calories
      t.integer  :price
      t.text    :img_url
      t.text    :ingredients
      t.integer  :sales_quantities
      t.timestamps
    end
  end
end
