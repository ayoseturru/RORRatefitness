class AddRateStringToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :rate, :string
  end
end
