class ChangePostsAndReviewsColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :content, :text, limit: 16.megabytes - 1
    change_column :reviews, :content, :text, limit: 16.megabytes - 1
    change_column :teachers, :description, :text, limit: 16.megabytes - 1
  end
end
