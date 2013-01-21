require 'spec_helper'

describe AllAboard::Persistence::SlidePersistence do
  describe "#save" do
    let(:board) { AllAboard::Persistence::BoardMetadata.create!(name: "Test Board") }
    let(:slide) { AllAboard::Slide.new(layout_name: "Layout Name") }
    before do
      slide.assign_to_board(board)
      slide.save
    end

    it "saves a single SlideMetadata to the database" do
      expect(AllAboard::Persistence::SlideMetadata.count).to be(1)
    end

    describe "the saved Slide" do
      subject { AllAboard::Persistence::SlideMetadata.first }
      its(:id) { should eq(slide.id) }
      its(:layout_name) { should eq("Layout Name") }
    end
  end
end
