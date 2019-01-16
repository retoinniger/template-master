require 'rails_helper'

describe "Show on index page", :type => :view do
  
  it "render page as guest" do
    visit root_path
    expect(page).to have_css("h1", text: "Please Log In")
    expect(page).to have_css("p", text: "© Reto Inniger")
    expect(page).to have_link('Login')
  end
  
end
