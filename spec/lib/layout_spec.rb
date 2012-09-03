require 'spec_helper'

class TestLayout < AllAboard::Layout
end

describe TestLayout do
  describe ".name" do
    subject { TestLayout.name }
    it { should eq("TestLayout") }
  end

  describe "#id" do
    subject { TestLayout.new.id }
    it { should eq("test_layout") }
  end

  describe "#render" do
    let(:layout) { TestLayout.new }
    let(:layout_rendering_context) { double("Layout Rendering Context") }
    let(:template) { double(render: "Render Return Value") }
    subject(:render) { layout.render }

    before do
      Tilt.stub(new: template)
      AllAboard::LayoutRenderingContext.stub(new: layout_rendering_context)
    end

    context "when rendering the template" do
      after { render }

      it "instantiates Tilt with the proper view path" do
        Tilt.should_receive(:new).and_return(template)
      end

      it "creates a LayoutRenderingContext with the passed-in slide" do
        AllAboard::LayoutRenderingContext.
          should_receive(:new).
          with(layout).
          and_return(layout_rendering_context)
      end

      it "renders the template in the LayoutRenderingContext's context" do
        template.
          should_receive(:render).
          with(layout_rendering_context)
      end
    end

    it { should eq("Render Return Value") }
  end
end
