# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    name "MyString"
    email "MyString"
    content "MyText"
  end
end
