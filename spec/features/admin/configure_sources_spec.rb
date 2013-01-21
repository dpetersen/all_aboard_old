require 'spec_helper'

feature "Configuring a source" do
  scenario "visiting configurable sources list" do
    visit AllAboard::Engine.routes.url_helpers.admin_path
    click_link "Configure Sources"

    expect(page).to have_content("BasicTestSource")
  end

  scenario "viewing a source's configuration" do
    visit AllAboard::Engine.routes.url_helpers.admin_sources_path
    click_link "BasicTestSource"

    expect(page).to have_content("Configuring BasicTestSource")
  end

  scenario "configuring a source" do
    visit AllAboard::Engine.routes.url_helpers.edit_admin_source_path("BasicTestSource")

    fill_in "A source value", with: "First Value"
    fill_in "A second source value", with: "Second Value"
    click_button "Save"

    expect(page).to have_content("Configuring BasicTestSource")
    expect(find_field("A source value").value).to eq("First Value")
    expect(find_field("A second source value").value).to eq("Second Value")
  end
end

feature "update a configured source" do
  background do
    AllAboard::SourceConfiguredAttribute.create!(source_name: "BasicTestSource", name: "a_source_value", value: "First Value")
  end

  scenario "update a source that's already been configured" do
    visit AllAboard::Engine.routes.url_helpers.edit_admin_source_path("BasicTestSource")
    expect(find_field("A source value").value).to eq("First Value")
    expect(find_field("A second source value").value).to be_blank

    fill_in "A source value", with: "Updated First Value"
    fill_in "A second source value", with: "Second Value"
    click_button "Save"

    expect(page).to have_content("Configuring BasicTestSource")
    expect(find_field("A source value").value).to eq("Updated First Value")
    expect(find_field("A second source value").value).to eq("Second Value")
  end
end
