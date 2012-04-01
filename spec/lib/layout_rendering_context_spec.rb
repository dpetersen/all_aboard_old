require 'spec_helper'

class LayoutRenderContextTestSource < Source
  perspective("Test Perspective") do
    "Markup from Test Perspective"
  end
end

describe LayoutRenderingContext do
  describe "#content_for_pane" do
    context "passed a pane number that has an assignment" do
      let!(:pane) do
        FactoryGirl.create(
          :perspective_assignment,
          position: 2,
          source_name: "LayoutRenderContextTestSource",
          perspective_name: "Test Perspective"
        )
      end
      let(:layout_rendering_context) { LayoutRenderingContext.new(pane.slide) }
      before { SourceManager.instance.register_source(LayoutRenderContextTestSource) }
      subject { layout_rendering_context.content_for_pane(2) }

      it { should == "Markup from Test Perspective" }
    end

    context "passed a pane number that has no assignment" do
      let(:slide) { FactoryGirl.create(:slide) }
      subject { LayoutRenderingContext.new(slide).content_for_pane(1) }
      it { should be_nil }
    end
  end
end
