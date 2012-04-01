require 'spec_helper'

describe Perspective do
  describe "#name" do
    let(:perspective) { Perspective.new(BasicTestSource, "Perspective Name") }
    subject { perspective.name }

    it { should == "Perspective Name" }
  end

  describe "#template" do
    let(:perspective) { Perspective.new(BasicTestSource, "Perspective Name") }
    let(:template) { double("Tilt Template") }
    before { Tilt.stub(new: template) }

    it "instantiates a tilt template with the expected file path" do
      Tilt.should_receive(:new).with(File.join(Rails.root, "/spec/fixtures/sources/basic_test_source/perspective_name.html.haml"))
      perspective.template
    end

    it "returns tilt template" do
      perspective.template.should == template
    end
  end
end
