require 'spec_helper'

describe AllAboard::LayoutRenderingContext do
  describe "#content_for_pane" do
    context "passed a pane number that has an assignment" do
      let(:slide) { AllAboard::Slide.new(perspective_assignments: [ perspective_assignment ]) }
      let(:perspective_assignment) do
        AllAboard::PerspectiveAssignment.new(
          position: 2,
          source_name: "BasicTestSource",
          perspective_name: "A Test Perspective"
        )
      end
      let(:layout_rendering_context) { AllAboard::LayoutRenderingContext.new(slide) }
      subject { layout_rendering_context.content_for_pane(2, AllAboard::QuarterPane) }

      it { should eq("Markup from a test perspective") }
    end

    context "passed a pane number that has no assignment" do
      let(:slide) { AllAboard::Slide.new }
      subject { AllAboard::LayoutRenderingContext.new(slide).content_for_pane(1, AllAboard::QuarterPane) }
      it { should be_nil }
    end
  end
end
