class AddTagToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tag, :text
  end
end
