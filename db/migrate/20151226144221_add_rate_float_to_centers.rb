class AddRateFloatToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :rate, :float
  end
end
