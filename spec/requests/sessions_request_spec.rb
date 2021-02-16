require 'rails_helper'
require 'capybara/rspec'

describe 'The sign-in process', type: :feature do
  it 'tests for successful sign-ins' do
    user = User.new(name: 'username', email: 'email@example.com')
    user.save
    visit '/login'
    within('form') do
      fill_in 'session_name', with: 'username'
    end
    click_button 'commit'

    expect(page).to have_content 'Welcome to Events planner, username!'
  end
end

RSpec.describe 'The sign-up process', type: :system do
  describe 'the correct fields appear on the sign-up page' do
    it 'shows the correct username' do
      visit '/users/new'
      expect(page).to have_content 'Username'
    end
    it 'shows the email from signup page' do
      visit '/users/new'
      expect(page).to have_content 'E-mail'
    end
  end
end
