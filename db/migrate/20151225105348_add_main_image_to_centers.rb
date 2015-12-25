class AddMainImageToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :main_image, :string
  end
end
