require 'spec_helper'

describe "pictures/edit" do
  before(:each) do
    @picture = assign(:picture, stub_model(Picture,
      :description => "MyString",
      :picture => "MyString",
      :product => nil
    ))
  end

  it "renders the edit picture form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => pictures_path(@picture), :method => "post" do
      assert_select "input#picture_description", :name => "picture[description]"
      assert_select "input#picture_picture", :name => "picture[picture]"
      assert_select "input#picture_product", :name => "picture[product]"
    end
  end
end
