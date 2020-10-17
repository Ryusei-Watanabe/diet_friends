class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.text :content, null: false
      t.timestamps
    end
    add_reference :chats, :user, foreign_key: true
    add_reference :chats, :group, foreign_key: true
  end
end
