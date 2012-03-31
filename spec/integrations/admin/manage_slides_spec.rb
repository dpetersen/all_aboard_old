require 'spec_helper'

feature "Add slides" do
  background do
    @board = FactoryGirl.create(:board, name: "Board Name")
  end

  scenario "Clicking the button.  Not much to say." do
    visit admin_board_path(@board)
    click_button "Add Slide"

    page.should have_content("Slide was successfully created")
    page.should have_content("Editing Board Name slide #1")
  end
end

feature "Assign layout to slide" do
  background do
    board = FactoryGirl.create(:board, name: "Board Name")
    @slide = board.slides.create!
  end

  scenario "assign a layout to an existing slide" do
    visit edit_admin_board_slide_path(@slide.board, @slide)
    select "Quarters", from: "Layout name"
    click_button "Set Layout"

    page.should have_content("Slide was successfully updated")
    page.find_field("Layout").value.should == "Quarters"
  end
end
