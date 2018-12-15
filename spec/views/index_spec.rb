require 'rails_helper'

describe 'Showing the home page' do
  it 'displays a welcome message' do
    visit root_path
    expect(page).to have_title 'Please Log IN'
    expect(page).to have_headline 'Hello'
  end

end
