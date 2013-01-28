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
end
