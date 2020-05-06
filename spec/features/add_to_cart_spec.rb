require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

  before :each do 
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end

    scenario "check the text rendered in the top nav  changes from 'My Cart (0)' to 'My Cart (1)'" do
      # ACT
      visit root_path
      
      expect(page).to have_content("My Cart (0)")
  
      # VERIFY
      page.first('article.product').click_button('Add')
      expect(page).to have_content("My Cart (1)")

      # DEBUG
      save_screenshot
    end
  
  end
end
