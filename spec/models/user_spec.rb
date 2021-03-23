require 'rails_helper'

RSpec.configure do |c|
  c.use_transactional_examples = false
  c.order = 'defined'
end

RSpec.describe 'User', type: :model do
  it 'is valid with a full name and a username' do
    user = User.new(fullname: 'Rose Sumba', username: 'rosesumba2')
    expect(user).to be_valid
  end
  it 'is invalid without a username' do
    user = User.create(fullname: 'Rose Sumba', username: '')
    expect(user).not_to be_valid
  end
  describe 'associations' do
    it 'can have many authored tweets' do
      user = User.reflect_on_association(:authored_tweets)
      expect(user.macro).to eql(:has_many)
    end
    it 'can have many followed users' do
      user = User.reflect_on_association(:active_followings)
      expect(user.macro).to eql(:has_many)
    end
    it 'can have many followers' do
      user = User.reflect_on_association(:passive_followings)
      expect(user.macro).to eql(:has_many)
    end
  end
end
