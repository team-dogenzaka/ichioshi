class Review < ApplicationRecord
    validates :title, presence: true
end
