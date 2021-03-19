class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :author, class_name: 'User'
end
