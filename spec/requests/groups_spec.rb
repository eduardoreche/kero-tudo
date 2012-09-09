require 'spec_helper'

describe "Groups" do
  
  before :each do 
    @group = FactoryGirl.build(:group)
    @group.save
  end
  
  after :each do
    @group.destroy
    
  end
  
  describe "POST /groups" do
    it "create a new group" do
        group_name = "Group test1"
      
        visit groups_path
        click_link "Create group"
        fill_in "Name", with: group_name
        click_button "Create Group"
        
        page_should_have_create_success_message("Group")
        page.should have_content "Name: #{group_name}"
    end
  end
  
  describe "POST edit/group" do
    
    it "update an existing group" do
      group_name = "Group test1"
      
      Group.create!(name: group_name)
      
      visit groups_path
      
      click_link "Edit"
      
      fill_in "Name", with: group_name
      click_button "Update Group"
      
      page_should_have_update_success_message("Group")
      page.should have_content "Name: #{group_name}"
    end
  end
  
  describe "GET destroy/groups" do
    
    it "delete an existing group", js: true do 
      Group.create!(name: "test")
      
      visit groups_path
      
      page.evaluate_script("window.confirm = function(){ return true; }")
      click_link "Destroy"
      
    end
  end
  
end