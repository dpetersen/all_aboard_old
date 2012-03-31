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
