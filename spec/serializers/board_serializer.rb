require 'spec_helper'

describe AllAboard::BoardSerializer do
  let(:hash) { AllAboard::BoardSerializer.new(board).as_json[:board] }
  subject { hash }

  describe "attributes" do
    let(:board) { AllAboard::Board.new(id: 19, name: "Test Name") }

    it "includes the id" do
      expect(hash[:id]).to eq(19)
    end

    it "includes the name" do
      expect(hash[:name]).to eq("Test Name")
    end
  end

  describe "associated slides" do
    subject { hash[:slides] }

    context "when not present" do
      let(:board) { AllAboard::Board.new }
      it { should be_empty }
    end

    context "when present" do
      let(:slide) { AllAboard::Slide.new(layout_name: "Quarters") }
      let(:board) { AllAboard::Board.new(slides: [ slide ]) }

      it { should_not be_empty }

      it "includes the slide" do
        expect(hash[:slides].first[:markup]).to be_present
      end
    end
  end
end
