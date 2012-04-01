require 'spec_helper'

class SourceManagerSpecTestSource < Source
end

describe SourceManager do
  let(:source_manager) { SourceManager.new }

  describe ".instance" do
    it "returns an instance of itself" do
      SourceManager.instance.should be_a(SourceManager)
    end

    it "returns the same instance for every call" do
      first_instance = SourceManager.instance
      SourceManager.instance.should == first_instance
    end
  end

  describe "#source_for_name" do
    subject { source_manager.source_for_name("SourceManagerSpecTest") }

    context "with a source class registered" do
      before { source_manager.register_source(SourceManagerSpecTestSource) }

      it { should == SourceManagerSpecTestSource }
    end
  end

  describe "#source_classes" do
    subject { source_manager.source_classes }

    context "with a source class registered" do
      before { source_manager.register_source(SourceManagerSpecTestSource) }

      it { should == [ SourceManagerSpecTestSource ] }
    end
  end
end
