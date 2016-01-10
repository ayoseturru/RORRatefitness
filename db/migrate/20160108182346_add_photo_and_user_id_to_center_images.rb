class AddPhotoAndUserIdToCenterImages < ActiveRecord::Migration
  def up
    add_attachment :center_images, :photo
  end

  def down
    remove_attachment :center_image, :photo
  end
end
