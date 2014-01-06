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

end
