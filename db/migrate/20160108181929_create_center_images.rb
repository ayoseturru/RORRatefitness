class CreateCenterImages < ActiveRecord::Migration
  def change
    create_table :center_images do |t|

      t.timestamps null: false
    end
  end
end
