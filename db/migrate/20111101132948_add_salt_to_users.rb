class AddSaltToUsers < ActiveRecord::Migration
  def up
    add_column :users, :salt, :string
    rename_column :users, :password, :encrypted_password
  end

  def down
    rename_column :users, :encrypted_password, :password
    remove_column :users, :salt
  end
end
