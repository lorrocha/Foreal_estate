# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    street_address "MyString"
    city "MyString"
    state "MyString"
    postal_code 1
  end
end
