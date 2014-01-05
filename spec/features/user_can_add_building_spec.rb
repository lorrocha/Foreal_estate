require 'spec_helper'

feature 'User can add a building', %q{
    As a real estate associate
    I want to record a building
    So that I can refer back to pertinent information
} do
  # I must specify a street address, city, state, and postal code
  # Only US states can be specified
  # I can optionally specify a description of the building
  # If I enter all of the required information in the required format, the building is recorded.
  # If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
  # Upon successfully creating a building, I am redirected so that I can record another building.

  def successful_building
    fill_in 'Street address', with: '24 Hancock St.'
    fill_in 'City', with: 'Weymouth'
    select 'Massachusetts', from: 'State'
    fill_in 'Postal code', with: '12345'
    click_button 'Create Building'
  end

  scenario 'User can successfully create a building' do
    visit '/buildings'
    click_on 'Add New Listing'
    successful_building
    save_and_open_page
    expect(page).to have_content 'Building was successfully created'
  end

  scenario 'User cannot create building with missing fields' do
    visit '/buildings'
    click_on 'Add New Listing'

    click_button 'Create Building'
    expect(page).to have_content("can't be blank")
  end

end
