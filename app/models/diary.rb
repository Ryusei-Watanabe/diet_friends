class Diary < ApplicationRecord
  belongs_to :user
  validates :study, length: { maximum: 1000 }
  validates :create_date, presence: true
end
