class RemoveGeolocationFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :geolocation, :string
  end
end
