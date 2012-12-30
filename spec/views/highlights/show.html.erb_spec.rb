require 'spec_helper'

describe "highlights/show" do
  before(:each) do
    @highlight = assign(:highlight, stub_model(Highlight,
      :description => "Description",
      :celebration => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(//)
  end
end
