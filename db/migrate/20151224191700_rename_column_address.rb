class RenameColumnAddress < ActiveRecord::Migration
  def change
    rename_column :centers, :addres, :address
  end
end
