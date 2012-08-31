require 'spec_helper'

feature "Creating a Board" do
  scenario "creating a board with valid attributes" do
    visit AllAboard::Engine.routes.url_helpers.admin_boards_path
    click_link "New Board"
    fill_in "Name", with: "My New Board"
    click_button "Create Board"

    expect(page).to have_content("Board was successfully created")
    expect(page).to have_content("My New Board")
  end

  scenario "creating a board with invalid attributes" do
    visit AllAboard::Engine.routes.url_helpers.new_admin_board_path
    fill_in "Name", with: ""
    click_button "Create Board"

    expect(page).to have_content("Namecan't be blank")
  end
end

feature "Showing a Board" do
  background do
    FactoryGirl.create(:board, name: "Board Name")
  end

  scenario "following a link from the Boards list" do
    visit AllAboard::Engine.routes.url_helpers.admin_boards_path
    click_link "Board Name"

    expect(page).to have_content("Board Name")
  end
end
