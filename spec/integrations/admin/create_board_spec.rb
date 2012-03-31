require 'spec_helper'

feature "Creating a board" do
  scenario "creating a board with valid attributes" do
    visit admin_boards_path
    click_link "New Board"
    fill_in "Name", with: "My New Board"
    click_button "Save"

    page.should have_content("Board was successfully created")
    page.should have_content("My New Board")
  end
end
