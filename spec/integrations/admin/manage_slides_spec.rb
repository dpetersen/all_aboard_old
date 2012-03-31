require 'spec_helper'

class ManageSlideSpecTestSource < Source
  def self.name
    "Manage Slide Spec Test Source"
  end

  def self.perspectives
    [ "Test Perspective 1" ]
  end
end

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

feature "Assign perspectives to a slide" do
  background do
    board = FactoryGirl.create(:board, name: "Board Name")
    @slide = FactoryGirl.create(:slide, board: board)
    SourceManager.instance.register_source(ManageSlideSpecTestSource)
  end

  scenario "assign new perspective to an existing slide" do
    visit edit_admin_board_slide_path(@slide.board, @slide)
    within("#new-perspective-assignment") do
      select "Manage Slide Spec Test Source - Test Perspective 1", from: "Source and perspective"
      click_button "Assign Perspective"
    end

    page.should have_content("Perspective assignment was successfully created")
    page.should have_content("Editing Board Name slide #1")
  end
end

feature "List perspective assignments for a slide" do
  background do
    board = FactoryGirl.create(:board, name: "Board Name")
    @slide = FactoryGirl.create(:slide, board: board)
    SourceManager.instance.register_source(ManageSlideSpecTestSource)
    @slide.perspective_assignments.create!(
      source_name: "ManageSlideSpecTestSource",
      perspective_name: "Test Perspective 1"
    )
  end

  scenario "visiting slide edit page" do
    visit edit_admin_board_slide_path(@slide.board, @slide)

    within("#perspective-assignments ul") do
      within(".source") { page.should have_content("ManageSlideSpecTestSource") }
      within(".perspective") { page.should have_content("Test Perspective 1") }
    end
  end
end
