require 'rails_helper'

feature 'Shopping site' do
  scenario 'User views a list of products' do
    product = FactoryGirl.create(:product)
    product2 = FactoryGirl.create(:product)

    visit '/'

    expect(page).to have_content(product.name)
    expect(page).to have_content(product.description)
    expect(page).to have_image(product.image_url)
    expect(page).to have_content(product.price)

    expect(page).to have_content(product2.name)
    expect(page).to have_content(product2.description)
    expect(page).to have_image(product2.image_url)
    expect(page).to have_content(product2.price)
  end

  scenario "User adds a product to their cart" do
    product = FactoryGirl.create(:product)

    visit "/"

    click_button 'Add to Cart'

    expect(page).to have_content("Product added to cart")
    expect(page).to have_content(product.name)
  end

end
