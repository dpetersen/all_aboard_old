require 'spec_helper'

class TestLayout < Layout
end

describe TestLayout do
  describe ".name" do
    subject { TestLayout.name }
    it { should == "TestLayout" }
  end

  describe "#render" do
    let(:slide) { double("Slide") }
    let(:layout_rendering_context) { double("Layout Rendering Context") }
    let(:template) { double(render: "Render Return Value") }

    def render
      TestLayout.new.render(slide)
    end

    before do
      Tilt.stub(new: template)
      LayoutRenderingContext.stub(new: layout_rendering_context)
    end

    context "when rendering the template" do
      after { render }

      it "instantiates Tilt with the proper view path" do
        Tilt.should_receive(:new).and_return(template)
      end

      it "creates a LayoutRenderingContext with the passed-in slide" do
        LayoutRenderingContext.should_receive(:new).with(slide).and_return(layout_rendering_context)
      end

      it "renders the template in the LayoutRenderingContext's context" do
        template.should_receive(:render).with(layout_rendering_context)
      end
    end

    it "returns the templates rendered string" do
      render.should == "Render Return Value"
    end
  end
end
