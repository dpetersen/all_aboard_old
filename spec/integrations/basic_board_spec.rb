require 'spec_helper'

class BasicBoardSpecTestSource < Source
  perspective("A Test Perspective") do
    "Markup from BasicBoardSpecTestSource"
  end
end

feature "Board List" do
  background do
    FactoryGirl.create(:board, name: "A Test Board")
  end

  scenario "Viewing the list of boards" do
    visit root_path

    page.should have_content("A Test Board")
  end

  scenario "Choosing a board" do
    visit root_path
    click_link "A Test Board"

    page.should have_content("A Test Board")
  end
end

feature "Viewing board" do
  background do
    @board = FactoryGirl.create(:board)
    slide = FactoryGirl.create(:slide, board: @board, layout_name: "Quarters")
    slide.perspective_assignments.create!(
      source_name: "BasicBoardSpecTestSource",
      perspective_name: "A Test Perspective",
      position: 2
    )
    SourceManager.instance.register_source(BasicBoardSpecTestSource)
  end

  scenario "viewing a board with slides with layouts" do
    visit board_path(@board)

    within("#pane-2") do
      page.should have_content("Markup from BasicBoardSpecTestSource")
    end
  end
end
