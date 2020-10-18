class Group < ApplicationRecord
  has_many :assigns, dependent: :destroy
  has_many :users, through: :assigns
  has_many :chats
  validates :name, presence: true
  accepts_nested_attributes_for :assigns
end
