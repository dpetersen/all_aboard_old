require 'spec_helper'

class SourceManagerSpecTestSource
end

describe SourceManager do
  let(:source_manager) { SourceManager.new }

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
