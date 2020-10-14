class Diary < ApplicationRecord
  belongs_to :user
  validates :study, length: { maximum: 1000 }
end
