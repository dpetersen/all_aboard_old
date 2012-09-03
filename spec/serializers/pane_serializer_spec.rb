require 'spec_helper'

describe AllAboard::PaneSerializer do
  let(:source) { BasicTestSource }
  let(:pane) { AllAboard::Pane.new(position: 2, source: source) }
  let(:hash) { AllAboard::PaneSerializer.new(pane).as_json[:pane] }
  subject { hash }

  describe "position" do
    subject { hash[:position] }
    it { should eq(2) }
  end

  describe "source_data" do
    subject { hash[:source_data] }

    context "when a legitimate source is set" do
      context "when no data has been persisted for the source" do
        it { should eq(id: "BasicTestSource", data_object: {}) }
      end

      context "when data has been persisted for the source" do
        before { source.persist_data(test: "data") }
        it { should eq(id: "BasicTestSource", data_object: { "test" => "data" }) }
      end
    end

    context "when an invalid source is set" do
      let(:pane) { AllAboard::Pane.new(position: 2, source: nil) }
      it { should eq(id: nil, data_object: {}) }
    end
  end
end
