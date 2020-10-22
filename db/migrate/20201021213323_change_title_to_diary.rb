class ChangeTitleToDiary < ActiveRecord::Migration[5.2]
  def change
    change_column_null :diaries, :title, false
  end
end
