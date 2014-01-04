require 'spec_helper'

describe Category do
  it "should be nil if name was not entered" do
    cat = Category.new(name: "")
    cat.valid?
    cat.errors[:name].should_not be_empty
  end
end
