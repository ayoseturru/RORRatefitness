class AddRateTitleAndCommentToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :rate, :string
    add_column :reviews, :title, :string
    add_column :reviews, :comment, :string
  end
end
