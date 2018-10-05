class AddHashtagRefToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :hashtag, foreign_key: true
  end
end
