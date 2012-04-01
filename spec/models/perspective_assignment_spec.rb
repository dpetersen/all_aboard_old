require 'spec_helper'

describe PerspectiveAssignment do
  it { should belong_to(:slide) }
  it { should validate_presence_of(:slide) }
  it { should validate_presence_of(:source_name) }
  it { should validate_presence_of(:perspective_name) }

  describe "source_and_perspective=" do
    context "passed comma separated values" do
      subject { PerspectiveAssignment.new }
      before do
        subject.source_and_perspective = "MySource,Perspective Name"
      end

      its(:source_name) { should == "MySource" }
      its(:perspective_name) { should == "Perspective Name" }
    end

    context "passed with a perspective that has a comma in the name" do
      before do
        subject.source_and_perspective = "MySource,Perspective Name, with comma"
      end

      its(:source_name) { should == "MySource" }
      its(:perspective_name) { should == "Perspective Name, with comma" }
    end
  end

  describe "#source_and_perspective" do
    context "with a source and a perspective set" do
      subject do
        PerspectiveAssignment.new(
          perspective_name: "My Perspective",
          source_name: "MySource"
        ).source_and_perspective
      end

      it { should == "MySource,My Perspective" }
    end
  end

  describe "#position" do
    let(:slide) { FactoryGirl.create(:slide) }

    context "on a Slide's first PositionAssignment" do
      it "sets a position automatically" do
        slide.perspective_assignments.build.position.should == 1
      end
    end

    context "on a Slide's subsequent PositionAssignments" do
      before do
        FactoryGirl.create(:perspective_assignment, slide: slide)
      end

      it "sets the proper position on a new Slide" do
        slide.perspective_assignments.build.position.should == 2
      end
    end
  end
end
