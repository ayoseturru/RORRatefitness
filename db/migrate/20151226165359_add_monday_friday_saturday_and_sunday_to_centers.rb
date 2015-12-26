class AddMondayFridaySaturdayAndSundayToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :monday_friday, :string
    add_column :centers, :saturday, :string
    add_column :centers, :sunday, :string
  end
end
