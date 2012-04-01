require 'spec_helper'

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
    subject { source_manager.source_for_name("BasicTestSource") }

    context "with a source class registered" do
      before { source_manager.register_source(BasicTestSource) }

      it { should == BasicTestSource }
    end
  end

  describe "#source_classes" do
    subject { source_manager.source_classes }

    context "with a source class registered" do
      before { source_manager.register_source(BasicTestSource) }

      it { should == [ BasicTestSource ] }
    end
  end

  describe "#source_names" do
    subject { source_manager.source_names }

    context "with a source class registered" do
      before { source_manager.register_source(BasicTestSource) }

      it { should == [ "BasicTestSource" ] }
    end
  end

  describe "source_base_path" do
    subject { source_manager.source_base_path }

    context "by default" do
      it "defaults to app/sources" do
        subject.should =~ /app\/sources/
      end
    end

    context "when overridden" do
      before { source_manager.source_base_path = "/another/path" }
      it { should == "/another/path" }
    end
  end
end
