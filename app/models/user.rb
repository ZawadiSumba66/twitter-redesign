class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
    validates :fullname, presence: true
    has_many :tweets
    has_many :authored_tweets, foreign_key: 'author_id', class_name: 'Tweet'
    has_many :followings
    has_many :followers, through: :followings
    has_many :followees, class_name: 'Following', foreign_key: 'followedid'
    def follow(other_user)
        followings.create(followedid: other_user.id)
      end
    
      def unfollow(other_user)
        followings.find_by(followedid: other_user.id).destroy
      end
    
      def following?(other_user)
        followings.include?(other_user)
      end
end
