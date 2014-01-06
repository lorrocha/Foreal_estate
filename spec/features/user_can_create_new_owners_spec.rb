require 'spec_helper'

feature 'User can create a new owner', %q{
    As a real estate associate
    I want to record a building owner
    So that I can keep track of our relationships with owners
} do
  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  scenario 'User can create a new owner' do
    visit '/owners'
    click_on 'Add New Owner'
    fill_in 'First name', with: 'Frederricko'
    fill_in 'Last name', with: 'Bonnasuerte'
    fill_in 'Email', with: 'werf@yahoo.com'
    click_button 'Create Owner'

    expect(page).to have_content('Owner has been created')
    expect(page).to have_content('Add New Owner')
  end

  scenario 'Owner isnot created without proper valid attributes' do
    visit '/owners'
    click_on 'Add New Owner'
    click_button 'Create Owner'

    expect(page).to have_content("can't be blank")
  end

end
