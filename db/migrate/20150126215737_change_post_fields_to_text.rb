class ChangePostFieldsToText < ActiveRecord::Migration
  def change
    change_column :posts, :title, :text
    change_column :posts, :comments, :text
  end
end
