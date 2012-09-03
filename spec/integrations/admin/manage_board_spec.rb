require 'spec_helper'

describe "Managing a board" do
  let(:board) { AllAboard::Persistence::BoardMetadata.create!(name: "A Test Board") }

  it "sees a settings panel when clicking on the Settings link", :js do
    visit AllAboard::Engine.routes.url_helpers.board_path(board)
    expect(find("#settings")).to be_visible
  end
end
