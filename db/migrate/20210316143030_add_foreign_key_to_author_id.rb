class AddForeignKeyToAuthorId < ActiveRecord::Migration[6.1]
  def change
    remove_column :tweets, :author_id, :integer
  end
end
