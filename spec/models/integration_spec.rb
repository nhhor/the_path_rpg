require 'rails_helper'

describe 'the product creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can create a product' do
    visit '/'
    # save_and_open_page
    click_link('Sign up')
    fill_in('Email' , :with => 'jay@jay.com')
    fill_in('user_password', :with => '123456')
    fill_in('user_password_confirmation', :with => '123456')
    choose('user_admin_true')
    click_button('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Admin')
  end
end

#
# describe 'the product update path', {:type => :feature} do
#   it 'allows a user to change the name of the product' do
#     visit '/'
#     click_link('Create new product')
#     fill_in('Name' , :with => 'Pig Poppers')
#     fill_in('Cost', :with => '100')
#     fill_in('Country of origin', :with => '100')
#     click_button('Create Product')
#
#     first(:link, 'Pig Poppers').click
#     click_link('Edit Product')
#     fill_in('Name' , :with => 'Chalk Poppers')
#     click_button('Update Product')
#     expect(page).to have_content('Chalk Poppers')
#
#   end
# end
#
#
# describe 'the add a review path', {:type => :feature} do
#   it 'allows a user to add a review' do
#     visit '/'
#     click_link('Create new product')
#     fill_in('Name' , :with => 'Pig Poppers')
#     fill_in('Cost', :with => '100')
#     fill_in('Country of origin', :with => '100')
#     click_button('Create Product')
#     first(:link, 'Pig Poppers').click
#     click_link('Add a review')
#     fill_in('Author' , :with => 'Man Person')
#     fill_in('Content body', :with => 'I love this product, I am whole. I love this product, I am complete. I love this product, I have transcended. I love this product, I now know real meaning.')
#     fill_in('Rating', :with => '2')
#     click_button('Create Review')
#     expect(page).to have_content('Man Person')
#   end
# end
#
#
# describe 'the edit review path', {:type => :feature} do
#   it 'allows a user to edit a review' do
#     visit '/'
#     click_link('Create new product')
#     fill_in('Name' , :with => 'Pig Poppers')
#     fill_in('Cost', :with => '100')
#     fill_in('Country of origin', :with => '100')
#     click_button('Create Product')
#     first(:link, 'Pig Poppers').click
#     click_link('Add a review')
#     fill_in('Author' , :with => 'Man Person')
#     fill_in('Content body', :with => 'I love this product, I am whole. I love this product, I am complete. I love this product, I have transcended. I love this product, I now know real meaning.')
#     fill_in('Rating', :with => '2')
#     click_button('Create Review')
#     click_link('Man Person')
#     click_link('Edit review')
#     fill_in('Content body', :with => 'I like this product, I am whole. I like this product, I am complete. I like this product, I have transcended. I like this product, I now know real meaning.')
#     click_button('Update Review')
#     click_link('Man Person')
#     expect(page).to have_content('I like this product, I am whole. I like this product, I am complete. I like this product, I have transcended. I like this product, I now know real meaning.')
#   end
