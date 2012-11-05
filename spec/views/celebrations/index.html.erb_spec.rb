require 'spec_helper'

describe "celebrations/index" do
  before(:each) do
    assign(:celebrations, [
      stub_model(Celebration,
        :description => "Description",
        :day => 1,
        :month => 2,
        :special => false
      ),
      stub_model(Celebration,
        :description => "Description",
        :day => 1,
        :month => 2,
        :special => false
      )
    ])
  end

  it "renders a list of celebrations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
