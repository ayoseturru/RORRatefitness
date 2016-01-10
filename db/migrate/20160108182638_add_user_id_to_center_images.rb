class AddUserIdToCenterImages < ActiveRecord::Migration
  def change
    add_column :center_images, :user_id, :integer
  end
end
