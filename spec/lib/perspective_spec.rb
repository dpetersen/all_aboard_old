require 'spec_helper'

describe AllAboard::Perspective do
  describe "#name" do
    let(:perspective) { AllAboard::Perspective.new(BasicTestSource, "Perspective Name") }
    subject { perspective.name }

    it { should == "Perspective Name" }
  end

  describe "#template_for_pane" do
    let(:perspective) { AllAboard::Perspective.new(BasicTestSource, "Perspective Name") }
    let(:template) { double("Tilt Template") }
    before { Tilt.stub(new: template) }

    it "instantiates a tilt template with the expected file path" do
      Tilt.should_receive(:new).with(File.join(AllAboard::Engine.root, "/spec/fixtures/sources/basic_test_source/perspective_name.quarter_pane.html.haml"))
      perspective.template_for_pane(AllAboard::QuarterPane)
    end

    it "returns tilt template" do
      perspective.template_for_pane(AllAboard::QuarterPane).should == template
    end
  end
end
