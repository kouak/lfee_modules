class AuthLogic < ActiveRecord::Migration
  def self.up
    rename_column :users, :password, :crypted_password
    add_column :users, :password_salt, :string
    add_column :users, :persistence_token, :string
    add_column :users, :last_request_at, :datetime
    add_column :users, :single_access_token, :string
  end

  def self.down
    rename_column :users, :crypted_password, :password
    remove_column :users, :password_salt
    remove_column :users, :persistence_token
    remove_column :users, :last_request_at
    remove_column :users, :single_access_token
  end
end
