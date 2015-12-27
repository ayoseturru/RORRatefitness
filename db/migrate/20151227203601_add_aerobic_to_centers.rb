class AddAerobicToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :aerobic, :string
  end
end
