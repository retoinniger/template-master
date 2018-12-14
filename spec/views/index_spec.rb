require 'rails_helper'

describe 'Showing the home page' do
  before {visit root_path}

  it 'displays a welcome message' do
    expect(page).to have_title 'Homeage'
    expect(page).to have_headline 'Hello'
  end

end
