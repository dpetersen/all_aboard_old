require 'spec_helper'

class SourceManagerSpecTestSource
end

describe SourceManager do
  after { SourceManager.flush_sources }

  describe "#source_for_name" do
    subject { SourceManager.source_for_name("SourceManagerSpecTest") }

    context "with a source class registered" do
      before { SourceManager.register_source(SourceManagerSpecTestSource) }

      it { should == SourceManagerSpecTestSource }
    end
  end

  describe "#source_classes" do
    subject { SourceManager.source_classes }

    context "with a source class registered" do
      before { SourceManager.register_source(SourceManagerSpecTestSource) }

      it { should == [ SourceManagerSpecTestSource ] }
    end
  end

  describe "#flush_sources" do
    before do
      SourceManager.register_source(SourceManagerSpecTestSource) 
      SourceManager.flush_sources
    end

    it "clears out registered sources" do
      SourceManager.source_classes.should == []
    end
  end
end
