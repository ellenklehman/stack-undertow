require 'rails_helper'

describe "the signup process" do
  it 'goes to the new sign up page' do
    visit '/'
    click_link 'Sign Up'
    expect(page).to have_content 'Create'
  end

  it 'unsuccesfully signs up a user' do
    visit '/users/new'
    fill_in 'Email', :with => 'j@j'
    fill_in 'Password', :with => 'password'
    fill_in 'Password confirmation', :with => 'password'
    click_button 'Create Account'
    expect(page).to have_content 'Errors found'
  end

  it 'succesfully signs up a user' do
    visit '/users/new'
    fill_in 'Email', :with => 'example@example.com'
    fill_in 'Name', :with => 'Mr.Example'
    fill_in 'Password', :with => 'example'
    fill_in 'Password confirmation', :with => 'example'
    click_button 'Create Account'
    expect(page).to have_content 'Mr.Example'
  end
end
