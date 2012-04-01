require 'spec_helper'

describe BasicTestSource do
  describe ".filesystem_name" do
    subject { BasicTestSource.filesystem_name }
    it { should == "basic_test_source" }
  end

  describe ".name" do
    subject { BasicTestSource.name }
    it { should == "BasicTestSource" }
  end

  describe ".perspective_names" do
    subject { BasicTestSource.perspective_names }
    it { should == [ "A Test Perspective" ] }
  end

  describe "#render" do
    context "passed an existing perspective name" do
      subject { BasicTestSource.new.render("A Test Perspective", QuarterPane) }
      it { should == "Markup from a test perspective" }
    end
  end
end
