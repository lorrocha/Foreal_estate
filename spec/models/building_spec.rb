require 'spec_helper'


describe Building do
  it {should have_valid(:street_address).when('Blooop')}
  it {should_not have_valid(:street_address).when('', nil)}

  it {should have_valid(:city).when('Blooop')}
  it {should_not have_valid(:city).when('', nil)}

  it {should have_valid(:state).when('New York')}
  it {should_not have_valid(:state).when('WHOOOOPIE')}
  it {should_not have_valid(:state).when('', nil)}

  it {should have_valid(:postal_code).when(1234)}
  it {should_not have_valid(:postal_code).when('', nil, 'bloop')}

  it {should belong_to(:owner)}

  it 'should not have an owner if the owner has been destroyed' do
    owner = FactoryGirl.create(:owner)
    building = owner.buildings.build(city:'evert', postal_code:123, state:'New Jersey', street_address:'12weff 7')
    building.save

    owner.destroy
    expect(Building.last.owner).to eql(nil)

  end
end
