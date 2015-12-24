class AddDescriptionToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :description, :string
  end
end
