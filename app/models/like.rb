class Like < ApplicationRecord
  belongs_to :user
  belongs_to :review
  counter_culture :review
  has_many :notifications, dependent: :destroy
  validates :user_id, presence: true
  validates :review_id, presence: true
end
