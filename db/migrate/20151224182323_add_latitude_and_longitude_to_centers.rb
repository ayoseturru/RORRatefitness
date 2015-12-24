class AddLatitudeAndLongitudeToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :latitude, :string
    add_column :centers, :longitude, :string
  end
end
