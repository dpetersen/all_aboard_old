require 'spec_helper'

describe BasicTestSource do
  describe ".filesystem_name" do
    subject { BasicTestSource.filesystem_name }
    it { should eq("basic_test_source") }
  end

  describe ".name" do
    subject { BasicTestSource.name }
    it { should eq("BasicTestSource") }
  end

  describe ".perspective_names" do
    subject { BasicTestSource.perspective_names }
    it { should eq([ "A Test Perspective", "A Test Perspective With Data" ]) }
  end

  describe ".configurable_attributes" do
    subject { BasicTestSource.configurable_attributes }
    it { should eq([ :a_source_value, :a_second_source_value ]) }
  end

  describe "configuration" do
    subject { BasicTestSource.new.configuration }

    context "when there are no saved ConfiguredAttributes" do
      it { should eq({ a_source_value: nil, a_second_source_value: nil }) }
    end

    context "when a SourceConfiguredAttributes exists" do
      before do
        AllAboard::SourceConfiguredAttribute.create!(
          source_name: "BasicTestSource",
          name: "a_second_source_value",
          value: "Some Saved Value"
        )
      end
      it { should eq({ a_source_value: nil, a_second_source_value: "Some Saved Value" }) }
    end
  end

  describe "#persist_data" do
    let(:data) { "test data" }
    after { BasicTestSource.persist_data(data) }

    it "persists an update with itself and its data" do
      AllAboard::Update.
        should_receive(:persist).
        with(BasicTestSource, data)
    end
  end

  describe "#retrieve_data" do
    subject { BasicTestSource.retrieve_data }

    context "when data has been persisted" do
      let(:stored_data) { { key_1: "one", key_2: "two" } }
      before { BasicTestSource.persist_data(stored_data) }

      its(:length) { should eq(2) }
      it { expect(subject[:key_1]).to eq("one") }
      it { expect(subject[:key_2]).to eq("two") }
    end

    context "when no data has been persisted" do
      it { should be_empty }
    end
  end
end
