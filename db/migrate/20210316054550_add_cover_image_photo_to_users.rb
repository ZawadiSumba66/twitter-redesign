class AddCoverImagePhotoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :cover_image, :string
    add_column :users, :photo, :string
  end
end
