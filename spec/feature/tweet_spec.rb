require 'rails_helper'

RSpec.feature 'Tweet' do
  before(:each) do
    user = User.create(fullname: 'chris otieno', username: 'chris5')
    @tweet = Tweet.create(text: 'this is Africa', author_id: user.id)
  end
  scenario 'when a user signs in and posts a tweet' do
    visit '/users/sign_in'
    fill_in 'username', with: 'chris5'
    click_on 'Submit'
    fill_in 'tweet_text', with: 'this is Africa'
    click_on 'Tweet'
    expect(page).to have_content 'AfricaFactsZone'
  end
end
