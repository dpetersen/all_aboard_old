require 'spec_helper'

describe AllAboard::Perspective do
  describe "#name" do
    let(:perspective) { AllAboard::Perspective.new(BasicTestSource, "Perspective Name") }
    subject { perspective.name }

    it { should eq("Perspective Name") }
  end

  describe "#template_for_pane" do
    let(:perspective) { AllAboard::Perspective.new(BasicTestSource, "Perspective Name") }
    let(:template) { double("Tilt Template") }
    let(:multipath_finder) { double("Multipath Finder", find_file: "found/file/path") }
    before do
      AllAboard::MultipathFinder.stub(new: multipath_finder)
      Tilt.stub(new: template)
    end
    subject { perspective.template_for_pane(AllAboard::QuarterPane) }

    it { should eq(template) }

    context "when called" do
      after { subject }

      it "instantiates a MultipathFinder with the expected paths" do
        AllAboard::MultipathFinder.should_receive(:new).with(AllAboard::SourceManager.instance.source_base_paths)
      end

      it "calls #find_file on the MultipathFinder with the expected filename" do
        multipath_finder.should_receive(:find_file).with("basic_test_source/perspective_name.quarter_pane.html.haml")
      end

      it "instantiates a tilt template with the found file path" do
        Tilt.should_receive(:new).with("found/file/path")
      end
    end
  end
end
