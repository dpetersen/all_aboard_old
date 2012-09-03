require 'spec_helper'

describe AllAboard::SlideSerializer do
  let(:slide) { AllAboard::Slide.new(layout_name: "Quarters") }
  let(:hash) { AllAboard::SlideSerializer.new(slide).as_json[:slide] }
  subject { hash }

  describe "markup" do
    subject { hash[:markup] }
    it { should be_present }
  end

  describe "associated panes" do
    subject { hash[:panes] }

    context "when not present" do
      let(:slide) { AllAboard::Slide.new }
      it { should be_empty }
    end

    context "when present" do
      let(:pane) { AllAboard::Pane.new(position: 2) }
      let(:slide) { AllAboard::Slide.new(panes: [ pane ]) }

      it { should_not be_empty }

      it "includes the pane" do
        expect(hash[:panes].first[:position]).to eq(2)
      end
    end
  end
end
