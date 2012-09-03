require 'spec_helper'

describe "Managing Boards" do
  describe "adding a board" do
    it "can create a board", :js do
      visit AllAboard::Engine.routes.url_helpers.boards_path
      fill_in "Name", with: "New Board Name"
      click_button "Create"

      expect(page).to have_content("New Board Name")
      created_board = AllAboard::Persistence::BoardMetadata.first
      expect(current_path).to eq(AllAboard::Engine.routes.url_helpers.board_path(created_board))
    end
  end
end
