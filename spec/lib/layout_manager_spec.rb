require 'spec_helper'

describe AllAboard::LayoutManager do
  let(:layout_manager) { AllAboard::LayoutManager.new }

  describe ".instance" do
    it "returns an instance of itself" do
      expect(AllAboard::LayoutManager.instance).to be_a(AllAboard::LayoutManager)
    end

    it "returns the same instance for every call" do
      first_instance = AllAboard::LayoutManager.instance
      expect(AllAboard::LayoutManager.instance).to eq(first_instance)
    end
  end

  describe "#layout_for_name" do
    subject { layout_manager.layout_for_name("Quarters") }

    context "with a layout registered" do
      before { layout_manager.register_layout(AllAboard::Quarters) }

      it { should eq(AllAboard::Quarters) }
    end
  end

  describe "#register_layout" do
    before { layout_manager.register_layout(AllAboard::Quarters) }
    subject { layout_manager.layouts }

    it { should eq([ AllAboard::Quarters ]) }
  end

  describe "#layout_names" do
    before { layout_manager.register_layout(AllAboard::Quarters) }
    subject { layout_manager.layout_names }

    it { should eq([ "Quarters" ]) }
  end
end
