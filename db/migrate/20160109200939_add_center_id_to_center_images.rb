class AddCenterIdToCenterImages < ActiveRecord::Migration
  def change
    add_column :center_images, :center_id, :string
    add_column :center_images, :integer, :string
  end
end
