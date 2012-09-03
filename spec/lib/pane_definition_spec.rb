require 'spec_helper'

describe AllAboard::PaneDefinition do
  describe ".filesystem_name" do
    subject { AllAboard::PaneDefinition.filesystem_name }
    it { should eq("pane_definition") }
  end

  describe "#width" do
    it "explodes" do
      expect { AllAboard::PaneDefinition.new.width }.to raise_error(/specify/)
    end
  end

  describe "#height" do
    it "explodes" do
      expect { AllAboard::PaneDefinition.new.height }.to raise_error(/specify/)
    end
  end
end
