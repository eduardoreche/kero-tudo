require 'spec_helper'

describe "highlights/edit" do
  before(:each) do
    @highlight = assign(:highlight, stub_model(Highlight,
      :description => "MyString",
      :celebration => nil
    ))
  end

  it "renders the edit highlight form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => highlights_path(@highlight), :method => "post" do
      assert_select "input#highlight_description", :name => "highlight[description]"
      assert_select "input#highlight_celebration", :name => "highlight[celebration]"
    end
  end
end
