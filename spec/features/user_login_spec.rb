require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  before :each do 
    User.create!(
      first_name: "Mickey",
      last_name: "Mouse",
      email: "mickey@mail.com",
      password: "mickey",
      password_confirmation: "mickey"
    )
  end

  scenario "users can see all products" do
    # ACT
    visit login_path

    #VERYFY
    fill_in "email", with: "mickey@mail.com"
    fill_in "password", with: "mickey"

    click_button("Submit")

    expect(page).to have_content("Signed in as Mickey")
    
    #DEBUG
    save_screenshot
  end
  
end
