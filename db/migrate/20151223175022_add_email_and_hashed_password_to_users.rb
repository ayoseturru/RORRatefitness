class AddEmailAndHashedPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :hashed_password, :string
  end
end
