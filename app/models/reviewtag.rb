class Reviewtag < ApplicationRecord
    belongs_to :review
    belongs_to :hashtag
end
