require 'spec_helper'

describe "boards" do
  let!(:board) { AllAboard::Persistence::BoardMetadata.create!(name: "A Test Board") }

  describe "board list" do
    it "can view a list of boards" do
      visit AllAboard::Engine.routes.url_helpers.boards_path

      expect(page).to have_content("A Test Board")
    end

    it "can choose a board from the list", :js do
      visit AllAboard::Engine.routes.url_helpers.boards_path
      click_link "A Test Board"

      expect(page).to have_content("A Test Board")
      created_board = AllAboard::Persistence::BoardMetadata.first
      expect(current_path).to eq(AllAboard::Engine.routes.url_helpers.board_path(created_board))
    end
  end

  describe "viewing a board" do
    before do
      slide = board.slides.create!(layout_name: "Quarters")
      slide.perspective_assignments.create!(
        source_name: "BasicTestSource",
        perspective_name: "A Test Perspective With Data",
        position: 1
      )
      BasicTestSource.persist_data(test: "from persistence")
    end

    it "should see the expected layout", :js do
      visit AllAboard::Engine.routes.url_helpers.board_path(board)
      expect(page).to have_content("Quarters Layout")
      expect(page).to have_content("I am the test view with data: from persistence")
    end
  end
end

#feature "Viewing board" do
#  let(:board_metadata) { AllAboard::Persistence::BoardMetadata.create!(name: "Board Name") }
#  let(:board) { AllAboard::Board.find(board_metadata.id) }

#  background do
#    slide_metadata = board_metadata.slides.create!(layout_name: "Quarters")

#    slide_metadata.perspective_assignments.create!(
#      source_name: "BasicTestSource",
#      perspective_name: "A Test Perspective",
#       position: 2
#    )

#    slide_metadata.perspective_assignments.create!(
#      source_name: "BasicTestSource",
#      perspective_name: "A Perspective With Configuration Data",
#      position: 1
#    )

#    AllAboard::ConfiguredAttribute.create!(
#      source_name: "BasicTestSource",
#      name: "a_source_value",
#      value: "value from database"
#    )
#  end

#  scenario "viewing a board with slides with layouts" do
#    visit AllAboard::Engine.routes.url_helpers.board_path(board)
#  end
#end
