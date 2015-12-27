class AddServicesToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :fitness, :string
    add_column :centers, :zumba, :string
    add_column :centers, :aquagym, :string
    add_column :centers, :tennis, :string
  end
end
