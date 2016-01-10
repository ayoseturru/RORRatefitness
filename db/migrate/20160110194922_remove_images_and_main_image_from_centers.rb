class RemoveImagesAndMainImageFromCenters < ActiveRecord::Migration
  def change
    remove_column :centers, :images, :string
    remove_column :centers, :main_image, :string
  end
end
