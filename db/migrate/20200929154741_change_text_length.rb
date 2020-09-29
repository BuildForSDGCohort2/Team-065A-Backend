class ChangeTextLength < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :content, :text, limit: 16.megabytes - 1
  end
end
