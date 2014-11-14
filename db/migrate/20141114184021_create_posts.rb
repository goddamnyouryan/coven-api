class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :source
      t.integer :position
      t.string :url
      t.string :title
      t.string :comments
      t.datetime :external_created_at

      t.timestamps
    end
  end
end
