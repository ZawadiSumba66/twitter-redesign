class AddReferenceToAuthorId < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :author_id, :integer
  end
end
