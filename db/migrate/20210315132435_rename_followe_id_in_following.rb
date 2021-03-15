class RenameFolloweIdInFollowing < ActiveRecord::Migration[6.1]
  def change
    rename_column :followings, :followeid_id, :followedid
  end
end
