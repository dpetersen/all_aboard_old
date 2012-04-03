require 'spec_helper'

describe AllAboard::Pane do
  describe ".filesystem_name" do
    subject { AllAboard::Pane.filesystem_name }
    it { should == "pane" }
  end

  describe "#width" do
    it "explodes" do
      expect { AllAboard::Pane.new.width }.should raise_error(/specify/)
    end
  end

  describe "#height" do
    it "explodes" do
      expect { AllAboard::Pane.new.height }.should raise_error(/specify/)
    end
  end
end
