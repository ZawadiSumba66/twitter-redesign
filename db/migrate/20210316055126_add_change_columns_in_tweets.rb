class AddChangeColumnsInTweets < ActiveRecord::Migration[6.1]
  def change
    rename_column :tweets, :AuthorId, :author_id
    rename_column :tweets, :Text, :text
  end
end
