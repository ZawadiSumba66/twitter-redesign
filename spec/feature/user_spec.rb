require 'rails_helper'

RSpec.feature 'Users' do
  before(:each) do
    @user = User.create(fullname: 'chris otieno', username: 'chris5')
  end
  scenario 'when a user signs in' do
    visit '/users/sign_in'
    fill_in 'username', with: 'chris5'
    click_on 'Submit'
    expect(page).to have_content 'AfricaFactsZone'
  end
  scenario 'when a user logs out' do
    visit '/users/sign_in'
    fill_in 'username', with: 'chris5'
    click_on 'Submit'
    click_on 'Log out'
    expect(current_path).to eql('/users/sign_in')
  end
end
