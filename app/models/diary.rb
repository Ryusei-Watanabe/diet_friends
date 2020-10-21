class Diary < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :study, length: { maximum: 1000 }
  validates :create_date, presence: true
  validates :body_weight, numericality: { greater_than: 0, less_than: 200},allow_blank: true
end
