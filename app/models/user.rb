class User < ApplicationRecord
    validates :Username, presence: true, uniquness: true, length: { maximum: 20 }

    has_many :tweets
    has_many :followers, through: :followings
    has_many :followees, class_name: 'Following', foreign_key: 'followedid'
end
