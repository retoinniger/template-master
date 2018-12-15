require 'rails_helper'

describe 'Showing the home page' do
  it 'displays a welcome message' do
    
    expect(page).to have_title 'Homepage'
    expect(page).to have_headline 'Hello'
  end

end
