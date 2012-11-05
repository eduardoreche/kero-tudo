require 'spec_helper'

describe "celebrations/show" do
  before(:each) do
    @celebration = assign(:celebration, stub_model(Celebration,
      :description => "Description",
      :day => 1,
      :month => 2,
      :special => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/false/)
  end
end
