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
    it { should eq([ "A Test Perspective", "A Perspective With Configuration Data" ]) }
  end

  describe "#render" do
    context "passed an existing perspective name" do
      subject { BasicTestSource.new.render("A Test Perspective", AllAboard::QuarterPane) }
      it { should eq("Markup from a test perspective") }
    end
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

    context "when a ConfiguredAttributes exists" do
      before do
        AllAboard::ConfiguredAttribute.create!(
          source_name: "BasicTestSource",
          name: "a_second_source_value",
          value: "Some Saved Value"
        )
      end
      it { should eq({ a_source_value: nil, a_second_source_value: "Some Saved Value" }) }
    end
  end

  describe "#retrieve_data" do
    context "when data has been persisted" do
      let(:stored_data) { { key_1: "one", key_2: "two" } }
      before { BasicTestSource.persist_data(stored_data) }
      subject { BasicTestSource.retrieve_data }

      its(:length) { should eq(2) }
      it { expect(subject[:key_1]).to eq("one") }
      it { expect(subject[:key_2]).to eq("two") }
    end
  end
end
