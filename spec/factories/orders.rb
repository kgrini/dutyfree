# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    phone 1
    name "MyString"
    address "MyString"
  end
end
