class CreateFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :followings do |t|
      t.references :followeid
      t.references :followerid
      t.timestamps
    end
  end
end
