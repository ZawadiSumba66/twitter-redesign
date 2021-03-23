class RemoveReferenceInFollowings < ActiveRecord::Migration[6.1]
  def change
    remove_column :followings, :followerid_id
    remove_column :followings, :followedid
  end
end
