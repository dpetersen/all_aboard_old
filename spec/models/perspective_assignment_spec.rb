require 'spec_helper'

describe AllAboard::PerspectiveAssignment do
  it { should belong_to(:slide) }
  it { should validate_presence_of(:slide) }
  it { should validate_presence_of(:source_name) }
  it { should validate_presence_of(:perspective_name) }

  describe "source_and_perspective=" do
    context "passed comma separated values" do
      subject { AllAboard::PerspectiveAssignment.new }
      before do
        subject.source_and_perspective = "MySource,Perspective Name"
      end

      its(:source_name) { should eq("MySource") }
      its(:perspective_name) { should eq("Perspective Name") }
    end

    context "passed with a perspective that has a comma in the name" do
      before do
        subject.source_and_perspective = "MySource,Perspective Name, with comma"
      end

      its(:source_name) { should eq("MySource") }
      its(:perspective_name) { should eq("Perspective Name, with comma") }
    end
  end

  describe "#source_and_perspective" do
    context "with a source and a perspective set" do
      subject do
        AllAboard::PerspectiveAssignment.new(
          perspective_name: "My Perspective",
          source_name: "MySource"
        ).source_and_perspective
      end

      it { should eq("MySource,My Perspective") }
    end
  end

  describe "#position" do
    let(:slide) { FactoryGirl.create(:slide) }
    let(:perspective_assignment) { slide.perspective_assignments.build }
    subject { perspective_assignment.position }

    context "on a Slide's first PositionAssignment" do
      it { should eq(1) }
    end

    context "on a Slide's subsequent PositionAssignments" do
      before { FactoryGirl.create(:perspective_assignment, slide: slide) }
      it { should eq(2) }
    end
  end
end
