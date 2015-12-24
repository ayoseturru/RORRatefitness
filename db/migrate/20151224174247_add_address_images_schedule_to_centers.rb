class AddAddressImagesScheduleToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :addres, :string
    add_column :centers, :images, :string
    add_column :centers, :schedule, :string
  end
end
