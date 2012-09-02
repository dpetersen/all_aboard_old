require 'spec_helper'

describe AllAboard::PerspectiveAssignment do
  describe ".new" do
    context "with no arguments" do
      subject { AllAboard::PerspectiveAssignment.new }
      its(:source_name) { should be_nil }
      its(:perspective_name) { should be_nil }
      its(:position) { should be_nil }
    end

    context "passed attributes" do
      subject do
        AllAboard::PerspectiveAssignment.new(
          source_name: "Source Name",
          perspective_name: "Perspective Name",
          position: 2
        )
      end

      its(:source_name) { should eq("Source Name") }
      its(:perspective_name) { should eq("Perspective Name") }
      its(:position) { should eq(2) }
    end
  end
end
