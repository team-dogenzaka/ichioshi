class Hashtag < ApplicationRecord
    has_many :reviewtags, dependent: :destroy
    has_many :reviewtag_reviews, through: :reviewtags, source: :review
end
