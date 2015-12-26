class RemoveScheduleFromCenters < ActiveRecord::Migration
  def change
    remove_column :centers, :schedule, :string
  end
end
