class RemoveMunicipaltyAndGeolocationFromCenters < ActiveRecord::Migration
  def change
    remove_column :centers, :municipalty, :string
    remove_column :centers, :geolocation, :string
  end
end
