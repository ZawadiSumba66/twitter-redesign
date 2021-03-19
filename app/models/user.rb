class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
    validates :fullname, presence: true
    
    has_many :authored_tweets, foreign_key: 'author_id', class_name: "Tweet"

    has_many :active_followings, class_name: 'Following', foreign_key: :follower_id, dependent: :destroy
    has_many :followings, through: :active_followings, source: :followed
  
    has_many :passive_followings, class_name: 'Following', foreign_key: :followed_id, dependent: :destroy
    has_many :followers, through: :passive_followings, source: :follower

    def follow(other_user)
    active_followings.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_followings.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end

end
