require 'spec_helper'

describe LayoutManager do
  let(:layout_manager) { LayoutManager.new }

  describe ".instance" do
    it "returns an instance of itself" do
      LayoutManager.instance.should be_a(LayoutManager)
    end

    it "returns the same instance for every call" do
      first_instance = LayoutManager.instance
      LayoutManager.instance.should == first_instance
    end
  end

  describe "#layout_for_name" do
    subject { layout_manager.layout_for_name("Quarters") }

    context "with a layout registered" do
      before { layout_manager.register_layout(Layouts::Quarters) }

      it { should == Layouts::Quarters }
    end
  end

  describe "#register_layout" do
    before { layout_manager.register_layout(Layouts::Quarters) }
    subject { layout_manager.layouts }

    it { should == [ Layouts::Quarters ] }
  end

  describe "#layout_names" do
    before { layout_manager.register_layout(Layouts::Quarters) }
    subject { layout_manager.layout_names }

    it { should == [ "Quarters" ] }
  end
end
