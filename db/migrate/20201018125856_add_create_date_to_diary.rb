class AddCreateDateToDiary < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :create_date, :date, null: false
  end
end
