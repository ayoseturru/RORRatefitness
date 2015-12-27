class AddPriceToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :price, :string
  end
end
