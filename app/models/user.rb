class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :fullname, presence: true

  has_many :likes

  has_many :authored_tweets, foreign_key: 'author_id', class_name: 'Tweet'

  has_many :active_followings, class_name: 'Following', foreign_key: :follower_id, dependent: :destroy
  has_many :followings, through: :active_followings, source: :followed

  has_many :passive_followings, class_name: 'Following', foreign_key: :followed_id, dependent: :destroy
  has_many :followers, through: :passive_followings, source: :follower

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  mount_uploader :photo, PhotoUploader
  mount_uploader :cover_image, CoverImageUploader

  def follow(other_user)
    active_followings.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_followings.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end

  def followings_posts
    followings_ids = followings.map(&:id)
    followings_ids << id
    Tweet.all.ordered_by_most_recent.where(author_id: followings_ids)
  end
end
