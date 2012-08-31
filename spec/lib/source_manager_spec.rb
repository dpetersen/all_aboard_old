require 'spec_helper'

describe AllAboard::SourceManager do
  let(:source_manager) { AllAboard::SourceManager.new }

  describe ".instance" do
    it "returns an instance of itself" do
      expect(AllAboard::SourceManager.instance).to be_a(AllAboard::SourceManager)
    end

    it "returns the same instance for every call" do
      first_instance = AllAboard::SourceManager.instance
      expect(AllAboard::SourceManager.instance).to eq(first_instance)
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

  describe "#source_base_paths" do
    subject(:base_paths) { source_manager.source_base_paths }

    context "by default" do
      its(:length) { should == 1 }

      it "includes app/sources" do
        expect(base_paths.first).to match(/app\/sources/)
      end
    end

    context "when additional paths have been registered" do
      before { source_manager.register_source_base_path("another/path") }

      its(:length) { should == 2 }

      it "adds the additional path to the front of the list" do
        expect(base_paths.first).to eq("another/path")
      end
    end
  end

  describe "#queue_jobs_for_frequency" do
    context "passed :five_minutes" do
      it "runs jobs scheduled to run at that frequency" do
        TestEveryFiveJob.should_receive(:perform_async)
        TestFourTimesDailyJob.should_not_receive(:perform_async)

        AllAboard::SourceManager.instance.queue_jobs_for_frequency(:five_minutes)
      end
    end
  end
end
