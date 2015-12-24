class AddPhoneAndSecondPhoneToCenter < ActiveRecord::Migration
  def change
    add_column :centers, :phone, :string
    add_column :centers, :second_phone, :string
  end
end
