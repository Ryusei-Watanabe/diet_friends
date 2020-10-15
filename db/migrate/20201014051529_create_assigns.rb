class CreateAssigns < ActiveRecord::Migration[5.2]
  def change
    create_table :assigns do |t|
      t.timestamps
    end
    add_reference :assigns, :user, foreign_key: true
    add_reference :assigns, :group, foreign_key: true
  end
end
