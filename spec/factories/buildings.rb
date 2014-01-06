# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
    street_address "4 Dean St"
    city "Everett"
    state "Massachusetts"
    postal_code 02

    owner
  end
end
