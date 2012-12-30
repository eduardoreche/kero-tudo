require 'spec_helper'

describe "highlights/new" do
  before(:each) do
    assign(:highlight, stub_model(Highlight,
      :description => "MyString",
      :celebration => nil
    ).as_new_record)
  end

  it "renders new highlight form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => highlights_path, :method => "post" do
      assert_select "input#highlight_description", :name => "highlight[description]"
      assert_select "input#highlight_celebration", :name => "highlight[celebration]"
    end
  end
end
