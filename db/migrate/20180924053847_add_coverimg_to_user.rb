class AddCoverimgToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Coverimg, :text
  end
end
