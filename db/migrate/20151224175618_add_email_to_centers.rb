class AddEmailToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :email, :string
  end
end
