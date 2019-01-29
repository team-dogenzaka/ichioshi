class AddAmazonUrlToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :amazon_url, :string
  end
end
