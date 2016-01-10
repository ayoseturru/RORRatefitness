class RemoveUserIdFromCenterImages < ActiveRecord::Migration
  def change
    remove_column :center_images, :user_id, :integer
  end
end
