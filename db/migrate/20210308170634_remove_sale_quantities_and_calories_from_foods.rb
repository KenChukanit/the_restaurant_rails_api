class RemoveSaleQuantitiesAndCaloriesFromFoods < ActiveRecord::Migration[6.1]
  def change
    remove_column :foods, :sales_quantities, :integer
    remove_column :foods, :calories, :integer
  end
end
