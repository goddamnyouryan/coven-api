class AddMissingIndexesToPosts < ActiveRecord::Migration
  def change
    add_index :posts, :url, unique: true
    add_index :posts, [ :source, :position ]
  end
end
