require 'spec_helper'

#subject { page }

describe "Categories" do

  it "should have the h1 'Sample App'" do
    get 'categories/new'
    should have_selector?('h4', text: 'Добавить категорию')
  end
end