class AddCommentCountToPost < ActiveRecord::Migration
  def change
    add_column :posts, :comment_count, :integer
  end
end
