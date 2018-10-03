class RemoveHashtagFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :hashtag_id, :bigint
  end
end
