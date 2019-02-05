class AddAsinToReviews < ActiveRecord::Migration[5.2]
  def change
   add_column :reviews, :asin, :string
  end
end
