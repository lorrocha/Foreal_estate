require 'spec_helper'

describe Owner do
  it {should have_valid(:first_name).when('Dilbert')}
  it {should_not have_valid(:first_name).when('', nil)}

  it {should have_valid(:last_name).when('Dilbert')}
  it {should_not have_valid(:last_name).when('', nil)}

  it {should have_valid(:email).when('Dilbert@yahoo.com')}
  it {should_not have_valid(:email).when('', nil, 'wazzaup', 'something@something@ef.com', 'something.com', 'something @something.com')}
end
