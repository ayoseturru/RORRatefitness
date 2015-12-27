class AddMunicipalityToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :municipality, :string
  end
end
