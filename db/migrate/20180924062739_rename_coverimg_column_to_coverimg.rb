class RenameCoverimgColumnToCoverimg < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :Coverimg, :coverimg
  end
end
