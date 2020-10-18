class AddIconToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :icon, :string, null: false
  end
end
