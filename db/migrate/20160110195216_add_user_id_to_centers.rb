class AddUserIdToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :user_id, :integer
  end
end
