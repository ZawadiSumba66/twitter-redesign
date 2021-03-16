class RenameUsernameInUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :Username, :username
    rename_column :users, :FullName, :fullname
  end
end
