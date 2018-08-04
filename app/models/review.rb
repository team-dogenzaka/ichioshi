class Review < ApplicationRecord
    validates :title, presence: true
    belongs_to :user, optional: true
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
end