require 'spec_helper'

describe Pane do
  describe ".filesystem_name" do
    subject { Pane.filesystem_name }
    it { should == "pane" }
  end

  describe "#width" do
    it "explodes" do
      expect { Pane.new.width }.should raise_error(/specify/)
    end
  end

  describe "#height" do
    it "explodes" do
      expect { Pane.new.height }.should raise_error(/specify/)
    end
  end
end
