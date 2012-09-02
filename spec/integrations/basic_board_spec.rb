require 'spec_helper'

feature "Board List" do
  background do
    AllAboard::Persistence::BoardMetadata.create!(name: "A Test Board")
  end

  scenario "Viewing the list of boards" do
    visit AllAboard::Engine.routes.url_helpers.boards_path

    expect(page).to have_content("A Test Board")
  end

  scenario "Choosing a board" do
    visit AllAboard::Engine.routes.url_helpers.boards_path
    click_link "A Test Board"

    expect(page).to have_content("A Test Board")
  end
end

feature "Viewing board" do
  let(:board_metadata) { AllAboard::Persistence::BoardMetadata.create!(name: "Board Name") }
  let(:board) { AllAboard::Board.find(board_metadata.id) }

  background do
    slide_metadata = board_metadata.slides.create!(layout_name: "Quarters")

    slide_metadata.perspective_assignments.create!(
      source_name: "BasicTestSource",
      perspective_name: "A Test Perspective",
       position: 2
    )

    slide_metadata.perspective_assignments.create!(
      source_name: "BasicTestSource",
      perspective_name: "A Perspective With Configuration Data",
      position: 1
    )

    AllAboard::ConfiguredAttribute.create!(
      source_name: "BasicTestSource",
      name: "a_source_value",
      value: "value from database"
    )
  end

  scenario "viewing a board with slides with layouts" do
    visit AllAboard::Engine.routes.url_helpers.board_path(board)

    within("#pane-2") do
      expect(page).to have_content("Markup from a test perspective")
    end

    within("#pane-1") do
      expect(page).to have_content("Markup with a value from configuration: value from database")
    end
  end
end
