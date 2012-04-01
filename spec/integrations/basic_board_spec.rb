require 'spec_helper'

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
