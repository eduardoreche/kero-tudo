require 'spec_helper'

describe "highlights/index" do
  before(:each) do
    assign(:highlights, [
      stub_model(Highlight,
        :description => "Description",
        :celebration => nil
      ),
      stub_model(Highlight,
        :description => "Description",
        :celebration => nil
      )
    ])
  end

  it "renders a list of highlights" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
