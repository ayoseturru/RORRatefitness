class RemoveRateFromCenters < ActiveRecord::Migration
  def change
    remove_column :centers, :rate, :float
  end
end
