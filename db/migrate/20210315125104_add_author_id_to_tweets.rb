class AddAuthorIdToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :AuthorId, :integer
  end
end
