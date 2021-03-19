require 'rails_helper'

RSpec.configure do |c|
  c.use_transactional_examples = false
  c.order = 'defined'
end

RSpec.describe 'Tweet', type: :model do
     it 'is valid with a text' do
        user = User.create(fullname: 'Rose', username: "rose4")
        tweet = Tweet.new(text: 'Hello Kenya', author_id: user.id)
        expect(tweet).to be_valid
      end
      it 'is invalid without a text' do
        tweet = Tweet.create(text: '')
        expect(tweet).not_to be_valid
      end
    describe 'associations' do
          it 'belongs to author' do
            tweet = Tweet.reflect_on_association(:author)
            expect(tweet.macro).to eql(:belongs_to)
          end
      end
end
