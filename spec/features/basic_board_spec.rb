require 'spec_helper'

describe "boards", :js do
  let!(:board) { AllAboard::Persistence::BoardMetadata.create!(name: "A Test Board") }

  describe "board list" do
    before { visit "/all_aboard" }

    it "can view a list of boards" do
      expect(page).to have_content("A Test Board")
    end

    it "can choose a board from the list" do
      click_link "A Test Board"

      within(".brand") do
        expect(page).to have_content("A Test Board")
      end
    end

    it "can create a new board" do
      fill_in "name", with: "A Created Board"
      click_button "Add"

      within(".brand") do
        expect(page).to have_content("A Created Board")
      end
    end
  end

  #describe "viewing a board" do
  #  before do
  #    slide = board.slides.create!(layout_name: "Quarters")
  #    slide.perspective_assignments.create!(
  #      source_name: "BasicTestSource",
  #      perspective_name: "A Test Perspective With Data",
  #      position: 1
  #    )
  #    BasicTestSource.persist_data(test: "from persistence")
  #  end

  #  it "should see the expected layout", :js do
  #    #visit "/board/#{board.id}"
  #    visit AllAboard::Engine.routes.url_helpers.boards_path
  #    click_link "A Test Board"
  #    page.driver.render("exc.png")
  #    expect(page).to have_content("Quarters Layout")
  #    expect(page).to have_content("I am the test view with data: from persistence")
  #  end
  #end
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
