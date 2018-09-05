class HashtagsReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags_reviews do |t|
      t.integer :review_id
      t.integer :hashtag_id
    end
  end
end
