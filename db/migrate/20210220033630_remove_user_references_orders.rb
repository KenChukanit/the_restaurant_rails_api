class RemoveUserReferencesOrders < ActiveRecord::Migration[6.1]
  def change
    remove_reference :orders, :user,  foreign_key: true
  end
end
