require 'spec_helper'

describe "pictures/show" do
  before(:each) do
    @picture = assign(:picture, stub_model(Picture,
      :description => "Description",
      :picture => "Picture",
      :product => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(/Picture/)
    rendered.should match(//)
  end
end
