require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

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
  end

  scenario "users can navigate from the home page to the product detail page by clicking on a product" do
    # ACT
    visit root_path
    find('a.btn-default', match: :first).click
    # page.first('article.product > header > a').click

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail'
  end
end
