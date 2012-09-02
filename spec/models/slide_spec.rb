require 'spec_helper'

describe AllAboard::Slide do
  describe ".new" do
    context "with no arguments" do
      subject { AllAboard::Slide.new }
      its(:layout_name) { should be_nil }
      its(:position) { should be_nil }
      its(:perspective_assignments) { should be_empty }
    end

    context "passed attributes" do
      subject do
        AllAboard::Slide.new(
          layout_name: "Test Layout",
          position: 2,
          perspective_assignments: [ "assignment" ]
        )
      end
      its(:layout_name) { should eq("Test Layout") }
      its(:position) { should eq(2) }
      its(:perspective_assignments) { should eq([ "assignment" ]) }
    end
  end
end
