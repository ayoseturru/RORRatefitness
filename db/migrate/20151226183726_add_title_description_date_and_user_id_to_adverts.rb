class AddTitleDescriptionDateAndUserIdToAdverts < ActiveRecord::Migration
  def change
    add_column :adverts, :title, :string
    add_column :adverts, :description, :string
    add_column :adverts, :date, :string
    add_column :adverts, :user_id, :integer
  end
end
