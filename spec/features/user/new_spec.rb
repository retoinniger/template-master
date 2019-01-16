require 'rails_helper'

describe 'Signing in' do
  context 'user is not signed up' do
    it 'is not possible to sign in' do
      visit new_user_session_path

      within '#new_user' do
        fill_in 'user_login',    with: ''
        fill_in 'user_password', with: ''
        click_button 'Log in'
      end

      expect(page).to have_content 'Invalid username or password.'
      expect(page).not_to have_link 'Logout'
    end
  end
    
  context 'user is signed up' do

    it 'is possible to sign in using email' do
      
      visit new_user_session_path

      expect(page).to have_title 'Log in'
      
      within '#new_user' do
        fill_in 'user_login',    with: ''
        fill_in 'user_password', with: ''
        click_button 'Log in'
      end

      expect(page).to have_content 'Signed in successfully.'
      expect(page).to have_link 'Logout'
    end
  end
end
