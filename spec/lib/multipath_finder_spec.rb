require 'spec_helper'

describe AllAboard::MultipathFinder do
  describe "#find_file" do

    context "when instantiated with multiple paths" do
      let(:multipath_finder) { AllAboard::MultipathFinder.new([ "first_path", "second_path" ]) }
      subject { multipath_finder.find_file("file.html.haml") }

      context "when matches exist in multiple paths" do
        before do
          File.stub(:exists?).with("first_path/file.html.haml").and_return(true)
          File.stub(:exists?).with("second_path/file.html.haml").and_return(true)
        end

        it { should eq("first_path/file.html.haml") }
      end

      context "when a match exists in a secondary path" do
        before do
          File.stub(:exists?).with("first_path/file.html.haml").and_return(false)
          File.stub(:exists?).with("second_path/file.html.haml").and_return(true)
        end

        it { should eq("second_path/file.html.haml") }
      end

      context "when no matches exist" do
        before do
          File.stub(:exists?).with("first_path/file.html.haml").and_return(false)
          File.stub(:exists?).with("second_path/file.html.haml").and_return(false)
        end

        it "raises an exception" do
          expect { subject }.to raise_error(/file 'file\.html\.haml'/)
        end
      end
    end
  end
end
