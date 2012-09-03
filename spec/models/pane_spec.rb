require 'spec_helper'

describe AllAboard::Pane do
  describe ".new" do
    context "with no arguments" do
      subject { AllAboard::Pane.new }
      its(:position) { should be_nil }
      its(:source) { should be_nil }
    end

    context "passed attributes" do
      subject { AllAboard::Pane.new(position: 2, source: "source") }
      its(:position) { should eq(2) }
      its(:source) { should eq("source") }
    end
  end
end
