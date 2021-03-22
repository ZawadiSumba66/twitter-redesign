class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :author, class_name: 'User'
  has_many :likes
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
