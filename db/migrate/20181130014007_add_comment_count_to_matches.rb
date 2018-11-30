class AddCommentCountToMatches < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :comments_count, :integer
  end
end
