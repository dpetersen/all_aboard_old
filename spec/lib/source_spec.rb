require 'spec_helper'

describe BasicTestSource do
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
      subject { BasicTestSource.new.render("A Test Perspective") }
      it { should == "Markup from a test perspective" }
    end
  end
end
