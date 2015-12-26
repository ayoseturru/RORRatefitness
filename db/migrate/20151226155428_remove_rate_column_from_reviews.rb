class RemoveRateColumnFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :rate, :string
  end
end
