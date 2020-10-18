class AddImageToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats,   :image, :string
  end
end
