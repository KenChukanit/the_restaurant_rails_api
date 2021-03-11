class ChangeIsStaff < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :isStaff, :boolean, default: false
  end

  def down
    change_column :users, :isStaff, :boolean
  end
end
