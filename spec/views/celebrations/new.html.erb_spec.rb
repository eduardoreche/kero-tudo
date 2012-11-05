require 'spec_helper'

describe "celebrations/new" do
  before(:each) do
    assign(:celebration, stub_model(Celebration,
      :description => "MyString",
      :day => 1,
      :month => 1,
      :special => false
    ).as_new_record)
  end

  it "renders new celebration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => celebrations_path, :method => "post" do
      assert_select "input#celebration_description", :name => "celebration[description]"
      assert_select "input#celebration_day", :name => "celebration[day]"
      assert_select "input#celebration_month", :name => "celebration[month]"
      assert_select "input#celebration_special", :name => "celebration[special]"
    end
  end
end
