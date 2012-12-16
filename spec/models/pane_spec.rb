require 'spec_helper'

describe AllAboard::Pane do
  describe ".new" do
    context "with no arguments" do
      subject { AllAboard::Pane.new }
      its(:position) { should be_nil }
      its(:source) { should be_nil }
      its(:perspective) { should be_nil }
    end

    context "passed attributes" do
      subject do
        AllAboard::Pane.new(
          position: 2,
          source: "source",
          perspective: "perspective",
          template_markup: "template_markup",
          configuration: "configuration"
        )
      end

      its(:position) { should eq(2) }
      its(:source) { should eq("source") }
      its(:perspective) { should eq("perspective") }
      its(:configuration) { should eq("configuration") }
    end
  end

  describe "#template_markup" do
    subject { pane.template_markup }
    let(:pane) { AllAboard::Pane.new( source: BasicTestSource, perspective: perspective) }

    context "when perspective is valid" do
      let(:perspective) { BasicTestSource.perspective_for_name("A Test Perspective") }
      it { should eq("Markup with {{handlebars}} from a test perspective") }
    end

    context "when the perspective is invalid" do
      let(:perspective) { BasicTestSource.perspective_for_name("Bad") }
      it { should include("Couldn't find") }
    end
  end
end
