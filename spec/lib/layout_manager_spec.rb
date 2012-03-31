require 'spec_helper'

describe LayoutManager do
  subject { LayoutManager.new }

  describe ".instance" do
    it "returns an instance of itself" do
      LayoutManager.instance.should be_a(LayoutManager)
    end

    it "returns the same instance for every call" do
      first_instance = LayoutManager.instance
      LayoutManager.instance.should == first_instance
    end
  end

  describe "#register_layout" do
    before do
      subject.register_layout(Layouts::Quarters)
    end

    its(:layouts) { should == [ Layouts::Quarters ] }
  end

  describe "#layout_names" do
    before do
      subject.register_layout(Layouts::Quarters)
    end

    its(:layout_names) { should == [ "Quarters" ] }
  end
end
