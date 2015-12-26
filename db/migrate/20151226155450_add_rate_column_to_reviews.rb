class AddRateColumnToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :rate, :float
  end
end
