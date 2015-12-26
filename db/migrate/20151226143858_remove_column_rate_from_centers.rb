class RemoveColumnRateFromCenters < ActiveRecord::Migration
  def change
    remove_column :centers, :rate, :string
  end
end
