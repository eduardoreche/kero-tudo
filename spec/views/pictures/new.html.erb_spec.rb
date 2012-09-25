require 'spec_helper'

describe "pictures/new" do
  before(:each) do
    assign(:picture, stub_model(Picture,
      :description => "MyString",
      :picture => "MyString",
      :product => nil
    ).as_new_record)
  end

  it "renders new picture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pictures_path, :method => "post" do
      assert_select "input#picture_description", :name => "picture[description]"
      assert_select "input#picture_picture", :name => "picture[picture]"
      assert_select "input#picture_product", :name => "picture[product]"
    end
  end
end
