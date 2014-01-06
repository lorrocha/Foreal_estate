feature 'User can corrolate buildings with owners', %q{
    As a real estate associate
    I want to correlate an owner with buildings
    So that I can refer back to pertinent information
} do
  # When recording a building, I want to optionally associate the building with its rightful owner.
  # If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  scenario 'A user can corrolate a building with an owner' do
    FactoryGirl.create(:owner)

    visit '/buildings'
    click_on 'Add New Listing'
    fill_in 'Street address', with: '24 Hancock St.'
    fill_in 'City', with: 'Weymouth'
    select 'Massachusetts', from: 'State'
    fill_in 'Postal code', with: '12345'
    select 'Frangelico Gnostia', from: 'Owner'
    click_button 'Create Building'

    expect(page).to have_content 'Building was successfully created'
  end

end
