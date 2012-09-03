require 'spec_helper'

describe AllAboard::Slide do
  describe ".new" do
    context "with no arguments" do
      subject { AllAboard::Slide.new }
      its(:layout_name) { should be_nil }
      its(:position) { should be_nil }
      its(:panes) { should be_empty }
    end

    context "passed attributes" do
      subject do
        AllAboard::Slide.new(
          layout_name: "Test Layout",
          position: 2,
          panes: [ "pane" ]
        )
      end
      its(:layout_name) { should eq("Test Layout") }
      its(:position) { should eq(2) }
      its(:panes) { should eq([ "pane" ]) }
    end
  end

  describe "#markup" do
    subject { Capybara.string(slide.markup) }

    context "with a valid layout_name" do
      let(:slide) { AllAboard::Slide.new(layout_name: "Quarters") }
      it { should have_selector(".pane-1") }
    end

    context "with an unknown layout_name" do
      let(:slide) { AllAboard::Slide.new(layout_name: "Bad") }
      it { should have_content("Unknown Layout Name 'Bad'") }
    end
  end
end
