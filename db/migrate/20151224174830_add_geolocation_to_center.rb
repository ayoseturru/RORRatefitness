class AddGeolocationToCenter < ActiveRecord::Migration
  def change
    add_column :centers, :geolocation, :string
  end
end
