class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true, length: { maximum: 20 }

    has_many :tweets
    has_many :followings
    has_many :followers, through: :followings
    has_many :followees, class_name: 'Following', foreign_key: 'followedid'
    
end
