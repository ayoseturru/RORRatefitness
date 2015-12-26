class AddCenterIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :center_id, :integer
  end
end
