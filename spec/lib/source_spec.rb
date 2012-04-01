require 'spec_helper'

class SourceSubclass < Source
  perspective("test_perspective") do
    "Markup from a test perspective"
  end
end

describe SourceSubclass do
  describe ".name" do
    subject { SourceSubclass.name }
    it { should == "SourceSubclass" }
  end

  describe ".perspective_names" do
    subject { SourceSubclass.perspective_names }
    it { should == [ "test_perspective" ] }
  end

  describe "#render" do
    context "passed an existing perspective name" do
      subject { SourceSubclass.new.render("test_perspective") }
      it { should == "Markup from a test perspective" }
    end
  end
end
